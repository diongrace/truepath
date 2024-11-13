import 'package:flutter/material.dart';
import 'package:truepath/screens/messager_screen.dart';

class MemoryGameAnimalsScreen extends StatefulWidget {
  @override
  _MemoryGameAnimalsScreenState createState() => _MemoryGameAnimalsScreenState();
}

class _MemoryGameAnimalsScreenState extends State<MemoryGameAnimalsScreen> {
  // Liste d'événements bibliques célèbres avec emojis
  List<String> bibleEvents = [
    '🌍 La Création du Monde', '🌍 La Création du Monde',
    '🌊 Le Déluge de Noé', '🌊 Le Déluge de Noé',
    '🌊 La Traversée de la Mer Rouge', '🌊 La Traversée de la Mer Rouge',
    '🦸‍♂️ David et Goliath', '🦸‍♂️ David et Goliath',
    '👶 La Naissance de Jésus', '👶 La Naissance de Jésus',
    '✝️ La Résurrection de Jésus', '✝️ La Résurrection de Jésus'
  ];

  List<bool> cardFlipped = [];
  List<bool> cardMatched = [];
  String firstCard = '';
  int firstIndex = -1;
  bool wait = false;

  @override
  void initState() {
    super.initState();
    setupGame();
  }

  // Fonction pour mélanger et initialiser l'état du jeu
  void setupGame() {
    bibleEvents.shuffle();  // Mélanger les événements pour randomiser les cartes
    cardFlipped = List.filled(bibleEvents.length, false);
    cardMatched = List.filled(bibleEvents.length, false);
  }

void flipCard(int index) async {
  if (wait || cardFlipped[index] || cardMatched[index]) return;

  setState(() {
    cardFlipped[index] = true;
  });

  if (firstCard == '') {
    firstCard = bibleEvents[index];
    firstIndex = index;
  } else {
    if (bibleEvents[index] == firstCard && index != firstIndex) {
      setState(() {
        cardMatched[firstIndex] = true;
        cardMatched[index] = true;
        firstCard = '';
        firstIndex = -1;
      });
    } else {
      wait = true;
      await Future.delayed(Duration(seconds: 1));
      
      // Vérifiez si le widget est toujours monté avant d'appeler setState()
      if (mounted) {
        setState(() {
          cardFlipped[firstIndex] = false;
          cardFlipped[index] = false;
          firstCard = '';
          firstIndex = -1;
          wait = false;
        });
      }
    }
  }

  // Vérifier si toutes les cartes sont appariées
  if (cardMatched.every((matched) => matched)) {
    _showSuccessPage();
  }
}


  // Fonction pour afficher la page de succès
  void _showSuccessPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizSuccessPage(
          score: cardMatched.where((matched) => matched).length,
          onPlayAgain: () {
            setState(() {
              setupGame();  // Recommencer le jeu
            });
            Navigator.pop(context); // Ferme la page de succès
          },
          totalQuizzes: 10, currentQuizIndex: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Mémoire - Événements Bibliques'),
        backgroundColor: Colors.deepPurple.shade700,  // Violet foncé pour l'app bar
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: bibleEvents.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => flipCard(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: cardMatched[index] ? Colors.green : Colors.white,  // Colorie la carte appariée en vert
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  cardFlipped[index] || cardMatched[index] ? bibleEvents[index] : '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,  // Centrage du texte
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
