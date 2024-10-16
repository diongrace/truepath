import 'package:flutter/material.dart';

class MemoryGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Mémoire'),
      ),
      body: Center(
        child: const Text('Ici, vous jouerez au Jeu de Mémoire!'),
      ),
    );
  }
}
