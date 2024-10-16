import 'package:flutter/material.dart';
import 'package:truepath/screens/quiz/quiz1_screen.dart';

class QuizIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue au Quiz!'),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF512DA8), // Couleur de départ (violet)
              Color(0xFFD1C4E9), // Couleur de fin (lavande)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ajout d'une image d'illustration au-dessus du texte
                // Image.asset(
                //   'assets/images/bac.jpeg', // Assurez-vous d'ajouter cette image dans vos assets
                //   height: 200,
                //   fit: BoxFit.cover,
                // ),
                const SizedBox(height: 40),
                const Text(
                  'Êtes-vous prêt à tester vos connaissances?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ce quiz comporte plusieurs questions passionnantes sur divers sujets.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                // Bouton avec animation de clic
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage1(), // Page du premier quiz
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Commencer le Quiz',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Un texte incitatif supplémentaire
                const Text(
                  'Bonne chance!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white60,
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
