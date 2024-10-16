import 'package:flutter/material.dart';

class PuzzleGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Puzzle'),
      ),
      body: Center(
        child: const Text('Ici, vous jouerez au Puzzle Biblique!'),
      ),
    );
  }
}
