import 'package:flutter/material.dart';
import 'package:truepath/screens/messager_screen.dart';

class QuizPage2 extends StatefulWidget {
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Questions, réponses et réponses correctes pour le quiz
  final List<String> _questions = [
    "Quel est le nom de la mère de Jésus?",
    "Quel miracle Jésus a-t-il accompli lors de son premier miracle?",
    "Quel était le métier de Jésus avant son ministère?",
    "Quel disciple a trahi Jésus?",
    "Combien de jours Jésus a-t-il jeûné dans le désert?",
  ];

  final List<List<String>> _answers = [
    ["Marie", "Élisabeth", "Martha", "Sara"],
    ["Transformer l'eau en vin", "Guérir un aveugle", "Marcher sur l'eau", "Multiplication des pains"],
    ["Charpentier", "Pêcheur", "Maçon", "Agriculteur"],
    ["Judas", "Pierre", "Jean", "Thomas"],
    ["30", "40", "20", "10"],
  ];

  final List<int> _correctAnswers = [0, 0, 0, 0, 1];

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
            totalQuizzes: 5, // Le nombre total de quiz dans l'application
            currentQuizIndex: 2, // L'index du quiz actuel, ici quiz 2
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
