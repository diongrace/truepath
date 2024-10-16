import 'package:flutter/material.dart';

class MatchingGameScreen extends StatefulWidget {
  @override
  _MatchingGameScreenState createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de Correspondance'),
      ),
      body: Center(
        child: const Text('Ici, vous jouerez au Jeu de Correspondance!'),
      ),
    );
  }
}
