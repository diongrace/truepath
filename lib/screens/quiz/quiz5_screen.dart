import 'package:flutter/material.dart';
import 'package:truepath/screens/messager_screen.dart';

class QuizPage5 extends StatefulWidget {
  @override
  _QuizPage5State createState() => _QuizPage5State();
}

class _QuizPage5State extends State<QuizPage5> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Questions, réponses et réponses correctes pour le quiz sur les miracles de Jésus
  final List<String> _questions = [
    "Quel miracle Jésus a-t-il accompli en premier?",
    "Combien de pains Jésus a-t-il utilisés pour nourrir 5000 personnes?",
    "Quel était le nom de la ville où Jésus a transformé l'eau en vin?",
    "Qui a été ressuscité par Jésus après avoir été mort pendant quatre jours?",
    "Quel miracle a permis à un aveugle de retrouver la vue?",
  ];

  final List<List<String>> _answers = [
    ["Transformer l'eau en vin", "Ressusciter Lazare", "Marcher sur l'eau", "Guérir un aveugle"],
    ["3 pains", "5 pains", "7 pains", "2 pains"],
    ["Nazareth", "Cana", "Bethléem", "Jérusalem"],
    ["Pierre", "Lazare", "Jairus", "Élie"],
    ["Guérison de l'aveugle de Jéricho", "Guérison de l'aveugle né", "Guérison de l'aveugle de Bethsaïda", "Aucune de ces réponses"],
  ];

  // Indices des bonnes réponses
  final List<int> _correctAnswers = [0, 1, 1, 1, 1]; // Corrigé : tous les indices sont mis à jour pour correspondre aux bonnes réponses

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizSuccessPage(
            score: _score,
            onPlayAgain: _resetQuiz,
            totalQuizzes: 5, // Nombre total de quizzes
            currentQuizIndex: 5, // Index du quiz actuel
          ),
        ),
      );
    }
  }

  void _resetQuiz() {
    if (mounted) {
      setState(() {
        _currentQuestionIndex = 0;
        _score = 0;
      });
      _controller.reset();
      _controller.forward();
    }
  }

  Widget _buildAnswerButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade800,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          if (index == _correctAnswers[_currentQuestionIndex]) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bonne réponse!')),
            );
            _score++;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Mauvaise réponse!')),
            );
          }
          _nextQuestion();
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
            colors: [Color(0xFF512DA8), Color(0xFFD1C4E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ..._answers[_currentQuestionIndex]
                  .asMap()
                  .entries
                  .map((entry) => _buildAnswerButton(entry.value, entry.key))
                  .toList(),
              const SizedBox(height: 40),
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
