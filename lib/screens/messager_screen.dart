import 'package:flutter/material.dart';
import 'package:truepath/screens/quiz/quiz1_screen.dart';
import 'package:truepath/screens/quiz/quiz2_screen.dart';
import 'package:truepath/screens/quiz/quiz3_screen.dart';
import 'package:truepath/screens/quiz/quiz4_screen.dart';
import 'package:truepath/screens/quiz/quiz5_screen.dart'; // Importez les autres écrans de quiz ici

class QuizSuccessPage extends StatelessWidget {
  final int score;
  final VoidCallback onPlayAgain;
  final int totalQuizzes; // Pour savoir combien de quiz vous avez
  final int currentQuizIndex; // Indice du quiz courant

  QuizSuccessPage({
    required this.score,
    required this.onPlayAgain,
    required this.totalQuizzes,
    required this.currentQuizIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultat du Quiz'),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Center(
        child: SingleChildScrollView( // Ajoutez cette ligne pour rendre l'écran défilable
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Texte Félicitations avec un effet d'ombre
              const Text(
                'Félicitations!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontFamily: 'Roboto',
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Color.fromRGBO(5, 5, 5, 0.5), // Utilisation de la couleur avec un facteur d'opacité directement

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Emoji des applaudissements
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '👏👏👏',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Affichage du score avec un style épuré
              Text(
                'Votre score: $score/$totalQuizzes',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Color.fromRGBO(5, 5, 5, 0.5), // Utilisation de la couleur avec un facteur d'opacité directement

                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Bouton de retour avec une légère animation au survol
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Retour à la page précédente
                },
                child: const Text('Retour'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  backgroundColor: Colors.purple.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),

              // Bouton de continuer à jouer avec un joli dégradé et animation
              ElevatedButton(
                onPressed: () {
                  // Naviguer vers le prochain quiz
                  if (currentQuizIndex < totalQuizzes - 1) {
                    // Assurez-vous que vous n'allez pas au-delà du dernier quiz
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          switch (currentQuizIndex) { // Utiliser currentQuizIndex sans décalage
                            case 0:
                              return QuizPage1();
                            case 1:
                              return QuizPage2();
                            case 2:
                              return QuizPage3();
                            case 3:
                              return QuizPage4();
                            case 4:
                              return QuizPage5();
                            default:
                              return QuizPage1(); // S'il y a un problème, renvoie au premier quiz
                          }
                        },
                      ),
                    );
                  } else {
                    // Si c'est le dernier quiz, afficher un message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Vous avez terminé tous les quiz!")),
                    );
                  }
                },
                child: const Text('Continuer à jouer'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
