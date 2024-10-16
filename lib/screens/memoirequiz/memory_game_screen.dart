import 'package:flutter/material.dart';
import 'package:truepath/screens/memoirequiz/MemoryGame_Screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue au Jeu!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGameCard(
              context,
              title: 'Jeu de mémoire',
              icon: Icons.memory,
              onTap: () {
                // Naviguer vers le jeu de mémoire
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemoryGameScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Colors.purple,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
