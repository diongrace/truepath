import 'package:flutter/material.dart';
import 'dart:math';

import 'package:truepath/screens/messager_screen.dart';

class MemoryGameScreen extends StatefulWidget {
  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  // Liste de versets bibliques avec emojis
  List<Map<String, String>> initialCards = [
    {'verse': 'Jean 3:16', 'emoji': '✝️'},  // Verset très connu
    {'verse': 'Psaume 23:1', 'emoji': '🌿'},  // Verset apaisant
    {'verse': 'Philippiens 4:13', 'emoji': '💪'},  // Verset sur la force
    {'verse': 'Matthieu 5:14', 'emoji': '🌟'},  // Verset sur la lumière
    {'verse': 'Romains 8:28', 'emoji': '💖'},  // Verset sur l'amour de Dieu
    {'verse': 'Proverbes 3:5', 'emoji': '🙏'},  // Verset sur la foi
  ];

  late List<Map<String, String>> cards;
  late List<bool> cardFlipped;
  late List<bool> cardMatched;
  String firstCard = '';
  int firstIndex = -1;
  bool wait = false;

  @override
  void initState() {
    super.initState();
    setupGame();
  }

  // Fonction pour initialiser le jeu
  void setupGame() {
    // Crée un jeu avec des paires de versets
    cards = List.from(initialCards)..addAll(initialCards);
    cards.shuffle(); // Mélange les cartes
    cardFlipped = List.filled(cards.length, false); // État des cartes retournées
    cardMatched = List.filled(cards.length, false); // État des cartes appariées
  }

  void flipCard(int index) async {
    if (wait || cardFlipped[index] || cardMatched[index]) return;

    setState(() {
      cardFlipped[index] = true;
    });

    if (firstCard == '') {
      // Premier choix de carte
      firstCard = cards[index]['verse']!;
      firstIndex = index;
    } else {
      // Deuxième choix de carte
      if (cards[index]['verse'] == firstCard && index != firstIndex) {
        // Les cartes correspondent
        setState(() {
          cardMatched[firstIndex] = true;
          cardMatched[index] = true;
          firstCard = '';
          firstIndex = -1;
        });
      } else {
        // Pas de correspondance, les retourner après un délai
        wait = true;
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          cardFlipped[firstIndex] = false;
          cardFlipped[index] = false;
          firstCard = '';
          firstIndex = -1;
          wait = false;
        });
      }
    }

    // Vérification si toutes les cartes sont appariées
    if (cardMatched.every((matched) => matched)) {
      _showSuccessPage();  // Affiche la page de succès
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
          totalQuizzes: 10, 
          currentQuizIndex: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Mémoire Biblique'),
        backgroundColor: Colors.purple.shade800, // Couleur principale : Violet
      ),
      body: cards.isEmpty
          ? Center(child: const CircularProgressIndicator()) // Si les cartes ne sont pas encore initialisées, afficher un indicateur de chargement
          : GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => flipCard(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardFlipped[index] || cardMatched[index] ? Colors.white : Colors.purple.shade800, // Couleur de fond des cartes
                      borderRadius: BorderRadius.circular(12), // Coins arrondis
                      boxShadow: [ // Ajout de l'ombre pour les cartes
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        // Affiche le verset et l'emoji quand la carte est retournée ou appariée
                        cardFlipped[index] || cardMatched[index]
                            ? '${cards[index]['verse']} ${cards[index]['emoji']}'
                            : '',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
