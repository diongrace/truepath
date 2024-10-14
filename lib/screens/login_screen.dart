import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Ajout d'une image de fond
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moise.jpeg'), // Assurez-vous d'avoir une image ici
            fit: BoxFit.cover, // Remplir tout l'espace
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo ou Titre de l'application
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.purple.shade800, // Icône violet
                ),
                const SizedBox(height: 20),
                // Titre de la page
                const Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texte blanc
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
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8), // Fond semi-transparent
                    borderRadius: BorderRadius.circular(20.0), // Coins plus arrondis
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4), // Ombre sous le champ
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(253, 250, 250, 250), // Transparent car déjà coloré avec le Container
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.purple.shade800), // Label violet
                      prefixIcon: Icon(Icons.email, color: Colors.purple.shade800),
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
                ),
                const SizedBox(height: 20),

                // Champ Mot de passe
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 244, 244).withOpacity(0.8), // Fond semi-transparent
                    borderRadius: BorderRadius.circular(20.0), // Coins plus arrondis
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 252, 251, 251),
                        offset: Offset(0, 4), // Ombre sous le champ
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent, // Transparent car déjà coloré avec le Container
                      labelText: 'Mot de passe',
                      labelStyle: TextStyle(color: Colors.purple.shade800), // Label violet
                      prefixIcon: Icon(Icons.lock, color: Colors.purple.shade800),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0), // Coins arrondis
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Ajout de padding
                    ),
                    obscureText: true, // Masquer le texte
                  ),
                ),
                const SizedBox(height: 30),

                // Bouton de Connexion
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade800, // Couleur violette du bouton
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Logique de connexion ici
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Texte blanc sur bouton violet
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Bouton pour créer un compte
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Créer un compte',
                    style: TextStyle(
                      color: Color.fromARGB(255, 249, 249, 249), // Texte blanc
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
    );
  }
}
