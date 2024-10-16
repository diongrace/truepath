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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Félicitations!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Votre score: $score/$totalQuizzes', // Affichage dynamique du nombre total de questions
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Retour à la page précédente
              },
              child: const Text('Retour'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                backgroundColor: Colors.purple.shade800,
              ),
            ),
            const SizedBox(height: 20),
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                backgroundColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
