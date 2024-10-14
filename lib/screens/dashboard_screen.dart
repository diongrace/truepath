import 'package:flutter/material.dart';

class DashboardHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil du Dashboard'),
        backgroundColor: Colors.purple.shade800, // Couleur de l'AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game.jpeg'), // Assurez-vous que le chemin est correct
            fit: BoxFit.cover, // Ajustez l'image pour couvrir tout l'espace
          ),
        ),
        child: Container(
          color: Color.fromARGB(2, 243, 241, 241), // Couleur de fond semi-transparente
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.videogame_asset,
                    size: 100,
                    color: Color.fromARGB(255, 153, 23, 182), // Couleur de l'icône
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bienvenue dans l\'application de jeux bibliques !',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Couleur du texte
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/games');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade800, // Couleur du bouton
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Coins arrondis
                      ),
                    ),
                    child: Text(
                      'Accéder aux jeux',
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
      ),
    );
  }
}
