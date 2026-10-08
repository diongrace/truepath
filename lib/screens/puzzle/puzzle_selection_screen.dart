import 'package:flutter/material.dart';
import 'package:truepath/screens/puzzle/PuzzleGame_Screen.dart';

class Puzzle {
  final String title;
  final String level;
  final String image;
  final int size;

  const Puzzle({
    required this.title,
    required this.level,
    required this.image,
    required this.size,
  });
}

class PuzzleSelectionScreen extends StatelessWidget {
  static const List<Puzzle> puzzles = [
    Puzzle(
      title: 'L\'Arche de Noé',
      level: 'Facile · 3 × 3',
      image: 'assets/images/puzzle_2.png',
      size: 3,
    ),
    Puzzle(
      title: 'Moïse et les tables de la Loi',
      level: 'Difficile · 4 × 4',
      image: 'assets/images/puzzle_3.png',
      size: 4,
    ),
  ];

  const PuzzleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisissez votre Puzzle'),
        backgroundColor: Colors.purple.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: puzzles.length,
        itemBuilder: (context, index) {
          final puzzle = puzzles[index];
          return _buildGameCard(
            context,
            puzzle: puzzle,
            onTap: () {
              // Naviguer vers l'écran du puzzle sélectionné
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PuzzleGameScreen(
                    title: puzzle.title,
                    image: puzzle.image,
                    size: puzzle.size,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, {required Puzzle puzzle, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(puzzle.image, width: 100, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    puzzle.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    puzzle.level,
                    style: TextStyle(fontSize: 15, color: Colors.purple.shade800),
                  ),
                ],
              ),
            ),
            Icon(Icons.extension, size: 32, color: Colors.purple.shade800),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
