import 'package:flutter/material.dart';
import 'package:truepath/screens/histoires_screen.dart';

// Page de lecture d'une histoire : grande image en haut, texte en dessous
class HistoireDetailScreen extends StatelessWidget {
  final Histoire histoire;

  const HistoireDetailScreen({super.key, required this.histoire});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.purple.shade800,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                histoire.titre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                ),
              ),
              background: Image.asset(histoire.image, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                histoire.texte,
                style: const TextStyle(fontSize: 17, height: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
