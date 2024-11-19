import 'package:flutter/material.dart';
import 'package:truepath/screens/messager_screen.dart';
import 'dart:math';

// Modèle de carte
class CardModel {
  final String id;
  final String text;
  final String type;
  bool isFaceUp;
  bool isMatched;

  CardModel({
    required this.id,
    required this.text,
    required this.type,
    this.isFaceUp = false,
    this.isMatched = false,
  });
}

class MatchingGameScreen extends StatefulWidget {
  @override
  _MatchingGameScreenState createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  List<CardModel> cards = [];
  int? firstSelectedIndex;
  int? secondSelectedIndex;
  bool isProcessing = false;
  int attempts = 0;
  int matchedPairs = 0;

  @override
  void initState() {
    super.initState();
    _initializeCards();
    _showInstructions();
  }

  void _initializeCards() {
    cards = [
      CardModel(id: "1", text: "Jean 3:16", type: "reference"),
      CardModel(id: "1", text: "Car Dieu a tant aimé le monde...", type: "verse"),
      CardModel(id: "2", text: "Genèse 1:1", type: "reference"),
      CardModel(id: "2", text: "Au commencement, Dieu créa les cieux...", type: "verse"),
      CardModel(id: "3", text: "Psaume 23:1", type: "reference"),
      CardModel(id: "3", text: "L'Éternel est mon berger...", type: "verse"),
      CardModel(id: "4", text: "Matthieu 28:19", type: "reference"),
      CardModel(id: "4", text: "Allez, faites de toutes les nations des disciples...", type: "verse"),
    ];
    cards.shuffle(Random());
  }

  void _showInstructions() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Instructions',
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Associez les références bibliques avec leurs versets.\n'
              '- Touchez une carte pour la retourner.\n'
              '- Les paires correctes restent visibles.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Commencer', style: TextStyle(color: Colors.purple)),
              ),
            ],
          );
        },
      );
    });
  }

  void _onCardTapped(int index) {
    if (isProcessing || cards[index].isFaceUp || cards[index].isMatched) return;

    setState(() {
      cards[index].isFaceUp = true;

      if (firstSelectedIndex == null) {
        firstSelectedIndex = index;
      } else {
        secondSelectedIndex = index;
        isProcessing = true;
        attempts++;

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            if (_isMatch()) {
              matchedPairs++;
              cards[firstSelectedIndex!].isMatched = true;
              cards[secondSelectedIndex!].isMatched = true;
            } else {
              cards[firstSelectedIndex!].isFaceUp = false;
              cards[secondSelectedIndex!].isFaceUp = false;
            }

            firstSelectedIndex = null;
            secondSelectedIndex = null;
            isProcessing = false;

            if (matchedPairs == cards.length ~/ 2) {
              _showSuccessPage(); // Appeler la page de succès lorsque toutes les paires sont trouvées
            }
          });
        });
      }
    });
  }

  bool _isMatch() {
    return cards[firstSelectedIndex!].id == cards[secondSelectedIndex!].id &&
        cards[firstSelectedIndex!].type != cards[secondSelectedIndex!].type;
  }

  // Fonction pour afficher la page de succès
  void _showSuccessPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizSuccessPage(
          score: matchedPairs, // Nombre de paires trouvées est le score
          onPlayAgain: () {
            setState(() {
              _initializeCards();  // Recommencer le jeu
              matchedPairs = 0;     // Réinitialiser le nombre de paires
              attempts = 0;         // Réinitialiser les tentatives
            });
            Navigator.pop(context); // Ferme la page de succès
          },
          totalQuizzes: 5, // Nombre total de quiz
          currentQuizIndex: 0, // Exemple d'indice pour le quiz courant
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Correspondance Biblique'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromARGB(255, 222, 202, 226), Color.fromARGB(177, 168, 71, 209)],
            center: Alignment.topLeft,
            radius: 2.0,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Paires trouvées: $matchedPairs / ${cards.length ~/ 2}\nTentatives: $attempts',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return GestureDetector(
                    onTap: () => _onCardTapped(index),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: card.isFaceUp || card.isMatched
                          ? Container(
                              key: ValueKey("faceUp-$index"),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color.fromARGB(255, 247, 244, 247), Color.fromARGB(255, 228, 224, 228)],
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  card.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container(
                              key: ValueKey("faceDown-$index"),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color.fromARGB(255, 242, 239, 243), Color.fromARGB(198, 22, 22, 23)],
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text(
                                  'Carte',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
