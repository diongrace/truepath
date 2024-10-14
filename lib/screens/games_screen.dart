import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jeux Bibliques',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Ajoutez votre image de fond ici
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              _buildGameCard(
                context,
                title: 'Quiz Biblique',
                icon: Icons.quiz,
                onTap: () {
                  Navigator.pushNamed(context, '/quiz');
                },
              ),
              _buildGameCard(
                context,
                title: 'Puzzle Biblique',
                icon: Icons.extension,
                onTap: () {
                  // Naviguer vers le jeu de puzzle
                },
              ),
              _buildGameCard(
                context,
                title: 'Jeu de correspondance',
                icon: Icons.compare_arrows,
                onTap: () {
                  // Naviguer vers le jeu de correspondance
                },
              ),
              _buildGameCard(
                context,
                title: 'Jeu de mémoire',
                icon: Icons.memory,
                onTap: () {
                  // Naviguer vers le jeu de mémoire
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context,
      {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade400.withOpacity(0.8),
                Colors.purple.shade800.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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