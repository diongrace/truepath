import 'package:flutter/material.dart';
import 'package:truepath/services/user_api_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ApiService apiService = ApiService();

  bool _obscurePassword = true; // Pour gérer la visibilité du mot de passe
  bool _isLoading = false; // Pour gérer l'état de chargement

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Utilisation de Stack pour superposer les widgets
        children: [
          // Image d'arrière-plan
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/moise.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Couche semi-transparente sur l'image
          Container(
            color: Colors.black.withOpacity(0.5), // Couleur noire avec opacité de 50%
          ),
          // Contenu principal
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icône de connexion
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.purple.shade800,
                    ),
                    const SizedBox(height: 20),
                    // Titre de la page
                    const Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Champ Email
                    _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      prefixIcon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Champ Mot de passe
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Mot de passe',
                      prefixIcon: Icons.lock,
                      obscureText: _obscurePassword,
                      toggleVisibility: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 30),

                    // Bouton de Connexion
                    _isLoading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple.shade800,
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              await _loginUser(context);
                            },
                            child: const Text(
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    const SizedBox(height: 15),

                    // Bouton pour réinitialiser le mot de passe
                    TextButton(
                      onPressed: () {
                        // Logique pour la réinitialisation du mot de passe
                      },
                      child: const Text(
                        'Mot de passe oublié?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Bouton pour créer un compte
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        'Créer un compte',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? toggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 249, 248, 248).withOpacity(0.8), // Fond semi-transparent
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          labelText: label,
          labelStyle: TextStyle(color: Colors.purple.shade800),
          prefixIcon: Icon(prefixIcon, color: Colors.purple.shade800),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: toggleVisibility != null
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.purple.shade800,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
        ),
      ),
    );
  }

  Future<void> _loginUser(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Vérifiez si les champs sont vides
    if (email.isEmpty || password.isEmpty) {
      _showDialog(context, "Veuillez remplir tous les champs", "Erreur");
      return;
    }

    print("Envoi à l'API :");
    print("Email: $email");
    print("Mot de passe: $password");

    setState(() {
      _isLoading = true; // Démarrer le chargement
    });

    // Appeler le service de connexion
    try {
      bool result = await apiService.login(email, password);
      setState(() {
        _isLoading = false; // Arrêter le chargement
      });

      if (result) {
        // Connexion réussie, redirigez vers le dashboard
        Navigator.pushReplacementNamed(context, '/dashboard');
        _showDialog(context, "Connexion réussie", "Succès");
      } else {
        // Affichez un message d'erreur
        _showDialog(context, "Erreur de connexion", "Erreur");
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Arrêter le chargement en cas d'erreur
      });
      // Gérer l'erreur d'inscription
      _showDialog(context, "Erreur lors de la connexion: $e", "Erreur");
    }
  }

  // Méthode pour afficher un dialogue
  void _showDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
