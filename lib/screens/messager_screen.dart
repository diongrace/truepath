import 'package:flutter/material.dart';
import 'package:truepath/screens/quiz2_screen.dart';
import 'package:truepath/screens/quiz3_screen.dart';
import 'package:truepath/screens/quiz4_screen.dart';
import 'package:truepath/screens/quiz5_screen.dart'; // Importez les autres écrans de quiz ici

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
        title: Text('Résultat du Quiz'),
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
            SizedBox(height: 20),
            Text(
              'Votre score: $score/${3}', // Mettez ici le nombre total de questions
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
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
                        switch (currentQuizIndex) {
                          case 0:
                            return QuizPage2(); // Redirection vers le quiz 2
                          case 1:
                            return QuizPage3(); // Redirection vers le quiz 3
                          case 2:
                            return QuizPage4(); // Redirection vers le quiz 4
                          case 3:
                            return QuizPage5(); // Redirection vers le quiz 5
                          // Ajoutez d'autres cas si nécessaire
                          default:
                            return QuizPage5(); // Retournez au premier quiz par défaut
                        }
                      },
                    ),
                  );
                } else {
                  // Si c'est le dernier quiz, peut-être montrer un message ou rediriger vers une page finale
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vous avez terminé tous les quiz!")),
                  );
                }
              },
              child: Text('Continuer à jouer'),
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
