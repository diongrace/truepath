import 'package:flutter/material.dart';
import 'package:truepath/screens/quiz4_screen.dart';

class QuizPage3 extends StatefulWidget {
  @override
  _QuizPage3State createState() => _QuizPage3State();
}

class _QuizPage3State extends State<QuizPage3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentQuestionIndex = 0;
  int _score = 0; // Ajoutez une variable pour garder le score
  final List<String> _questions = [
   "Combien d'Évangiles y a-t-il dans le Nouveau Testament?",
      "Quel Évangile commence par 'Au commencement était la Parole'?",
      "Qui a écrit l'Évangile selon Luc?",
      "Quel est l'Évangile le plus court?",
      "Dans quel Évangile trouve-t-on le Sermon sur la Montagne?",
  ];
  final List<List<String>> _answers = [
    ["4", "5", "3", "6"],
      ["Jean", "Matthieu", "Marc", "Luc"],
      ["Luc", "Jean", "Matthieu", "Marc"],
      ["Marc", "Luc", "Matthieu", "Jean"],
      ["Matthieu", "Marc", "Luc", "Jean"],
  ];
  List<int> _correctAnswers = [1, 1, 0]; // Index des bonnes réponses

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _controller.reset();
        _controller.forward();
      });
    } else {
      // Quand le quiz est terminé, redirigez vers la page de succès
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizSuccessPage(
            score: _score,
            onPlayAgain: _resetQuiz, // Passer la méthode pour redémarrer le quiz
          ),
        ),
      );
    }
  }

  void _resetQuiz() {
    // Vérifiez si le widget est monté avant d'appeler setState
    if (mounted) {
      setState(() {
        _currentQuestionIndex = 0;
        _score = 0; // Réinitialiser le score
      });
      _controller.reset(); // Réinitialisez l'animation
      _controller.forward(); // Redémarrer l'animation
    }
  }

  Widget _buildAnswerButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade800,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          if (index == _correctAnswers[_currentQuestionIndex]) {
            // Bonne réponse
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Bonne réponse!')),
            );
            _score++; // Incrémentez le score pour chaque bonne réponse
          } else {
            // Mauvaise réponse
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mauvaise réponse!')),
            );
          }
          _nextQuestion(); // Passe à la question suivante ou termine le quiz
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF512DA8), Color(0xFFD1C4E9)], // Dégradé de couleurs
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre de la question
              FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    _questions[_currentQuestionIndex],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Liste des réponses
              ..._answers[_currentQuestionIndex]
                  .asMap()
                  .entries
                  .map((entry) => _buildAnswerButton(entry.value, entry.key))
                  .toList(),

              const SizedBox(height: 40),

              // Indicateur de progression
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / _questions.length,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page de succès après le quiz
class QuizSuccessPage extends StatelessWidget {
  final int score;
  final VoidCallback onPlayAgain; // Callback pour redémarrer le quiz

  QuizSuccessPage({required this.score, required this.onPlayAgain});

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
              'Votre score: $score/${3}', // 3 est le nombre total de questions
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
                // Naviguer vers le QuizPage2
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage4()),
                );
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
