import 'package:flutter/material.dart';
import 'package:truepath/screens/memoirequiz/MemoryGame_Screen.dart';
import 'package:truepath/screens/memoirequiz/memory_game_animals_screen.dart'; // Jeu de mémoire standard

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenue au Jeu!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.purple.shade800, // Le violet spécifique pour l'AppBar
        elevation: 6, // Légère ombre sous l'AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Action pour les paramètres, si nécessaire
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.purple.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildGameCard(
                context,
                title: 'Jeu de mémoire standard',
                icon: Icons.memory,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemoryGameScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildGameCard(
                context,
                title: 'Jeu de mémoire Biblique',
                icon: Icons.book,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemoryGameScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildGameCard(
                context,
                title: 'Jeu de mémoire Animaux',
                icon: Icons.pets,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemoryGameAnimalsScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildGameCard(
                context,
                title: 'Plus de jeux à venir...',
                icon: Icons.games,
                onTap: () {
                  // Action pour ouvrir une autre page de jeu si disponible
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 15, // Augmenter l'élévation pour une ombre plus marquée
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // Coins plus arrondis pour un effet moderne
        ),
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4), // Ombre plus profonde
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0), // Plus de padding pour un effet de "largesse"
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300), // Animation fluide pour l'icône
                curve: Curves.easeInOut,
                child: Icon(
                  icon,
                  size: 85, // Augmenter la taille pour attirer l'attention
                  color: Colors.purple.shade700, // Couleur violette plus claire pour l'icône
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24, // Taille de police plus grande pour les titres
                  fontWeight: FontWeight.w600, // Police en gras mais pas trop lourde
                  color: Colors.purple.shade900, // Utilisation d'une nuance de violet plus foncée
                  letterSpacing: 1.5, // Espacement des lettres pour un meilleur effet visuel
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
