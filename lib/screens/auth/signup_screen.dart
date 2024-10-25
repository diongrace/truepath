import 'package:flutter/material.dart';
import 'package:truepath/services/models/user_model.dart';
import 'package:truepath/services/user_api_service.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final ApiService apiService = ApiService(); // Instance de ApiService

  bool _obscurePassword = true; 
  bool _obscureConfirmPassword = true; 
  bool _isLoading = false; // État de chargement

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inscription',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moise.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Dark overlay for improved text visibility
            Container(
              color: Colors.black54, // Semi-transparent black overlay
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Créez votre compte',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Color.fromARGB(166, 22, 22, 22),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildTextField(
                        controller: _nomController,
                        label: 'Nom',
                        prefixIcon: Icons.person,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _prenomController,
                        label: 'Prénom',
                        prefixIcon: Icons.person,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        label: 'Email',
                        prefixIcon: Icons.email,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        label: 'Confirmer le mot de passe',
                        prefixIcon: Icons.lock,
                        obscureText: _obscureConfirmPassword,
                        toggleVisibility: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _isLoading ? null : () async {
                          await _registerUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade800,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Créer un compte',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Loading indicator
            if (_isLoading)
              Container(
                color: Colors.black54, // Semi-transparent background
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/load.png', // Ensure the path is correct
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Indicator color
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser(BuildContext context) async {
    String nom = _nomController.text.trim();
    String prenom = _prenomController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (nom.isEmpty || prenom.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showDialog(context, "Tous les champs doivent être remplis", "Erreur", Colors.red);
      return;
    }

    if (password != confirmPassword) {
      _showDialog(context, "Les mots de passe ne correspondent pas", "Erreur", Colors.red);
      return;
    }

    User newUser = User(
      nom: nom, 
      prenom: prenom, 
      email: email,
      password: password,
      passwordConfirmation: confirmPassword,
    );

    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      var result = await apiService.signUp(newUser);
      setState(() {
        _isLoading = false; // Stop loading
      });

      if (result['success']) {
        // Successful signup
        _showDialog(context, "Inscription réussie !", "Succès", Colors.green);
        
        // Wait a moment before redirecting
        Future.delayed(const Duration(seconds: 0), () {
          Navigator.pushReplacementNamed(context, '/login'); // Redirect to login page
        });
      } else {
        _showDialog(context, "Erreur lors de l'inscription: ${result['message']}", "Erreur", Colors.red);
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading on error
      });
      _showDialog(context, "Erreur lors de l'inscription: $e", "Erreur", Colors.red);
    }
  }

  void _showDialog(BuildContext context, String message, String title, Color backgroundColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(color: Colors.white)),
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: backgroundColor, // Custom background color
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    required bool obscureText,
    VoidCallback? toggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
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
        keyboardType: label == 'Email' ? TextInputType.emailAddress : TextInputType.text,
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
}
