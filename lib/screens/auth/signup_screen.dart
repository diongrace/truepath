import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
        backgroundColor: Colors.purple.shade800, // Couleur de l'AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moise.jpeg'), // Ajoutez votre image de fond ici
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Titre de la page
                const Text(
                  'Créez votre compte',
                  style: TextStyle(
                    fontSize: 28,
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
                ),
                const SizedBox(height: 20),

                // Champ Mot de passe
                _buildTextField(
                  controller: _passwordController,
                  label: 'Mot de passe',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // Champ Confirmer Mot de passe
                _buildTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirmer le mot de passe',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // Bouton de Création de Compte
                ElevatedButton(
                  onPressed: () {
                    // Gérer la logique d'inscription ici
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade800, // Couleur du bouton
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Coins arrondis
                    ),
                  ),
                  child: const Text(
                    'Créer un compte',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Couleur du texte
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Fond semi-transparent
        borderRadius: BorderRadius.circular(20.0), // Coins arrondis
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4), // Ombre sous le champ
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent, // Transparent car déjà coloré avec le Container
          labelText: label,
          labelStyle: TextStyle(color: Colors.purple.shade800), // Label violet
          prefixIcon: Icon(prefixIcon, color: Colors.purple.shade800),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
            borderRadius: BorderRadius.circular(20.0), // Coins arrondis
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), // Coins arrondis
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Ajout de padding
        ),
      ),
    );
  }
}
