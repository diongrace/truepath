import 'package:flutter/material.dart';
import 'package:truepath/screens/puzzle/PuzzleGame_Screen.dart';

class Puzzle {
  final String title;
  final IconData icon;
  final Widget screen;

  Puzzle({required this.title, required this.icon, required this.screen});
}

class PuzzleSelectionScreen extends StatelessWidget {
final List<Puzzle> puzzles = [
  Puzzle(
    title: 'Puzzle 1',
    icon: Icons.extension, // Une icône valide
    screen: PuzzleGameScreen(), // Remplacez par votre écran de jeu
  ),
  Puzzle(
    title: 'Puzzle 2',
    icon: Icons.gamepad, // Changement ici
    screen: PuzzleGameScreen(), // Remplacez par un autre écran de jeu
  ),
  // Ajoutez d'autres puzzles ici
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisissez votre Puzzle'),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: puzzles.length,
          itemBuilder: (context, index) {
            final puzzle = puzzles[index];
            return _buildGameCard(
              context,
              title: puzzle.title,
              icon: puzzle.icon,
              onTap: () {
                // Naviguer vers l'écran du puzzle sélectionné
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => puzzle.screen),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.purple.shade800,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
