import 'package:flutter/material.dart';
import 'package:truepath/screens/etude_biblique_screen.dart';
import 'package:truepath/screens/histoires_screen.dart';
import 'package:truepath/screens/quiz_screen.dart';
import 'package:truepath/screens/video_biblique_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String userName;

  const DashboardScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF512DA8), Color(0xFFD1C4E9)], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // En-tête avec le nom de l'utilisateur, icône et logo
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Bonjour, $userName',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    _buildDashboardButton(
                      context,
                      'Histoires',
                      Icons.book,
                      Colors.blueAccent,
                      HistoiresScreen(), 
                    ),
                    _buildDashboardButton(
                      context,
                      'Étude Biblique',
                      Icons.menu_book,
                      Colors.greenAccent,
                      EtudeBibliqueScreen(), 
                    ),
                    _buildDashboardButton(
                      context,
                      'Vidéo Biblique',
                      Icons.video_library,
                      Colors.orangeAccent,
                      VideoBibliqueScreen(), 
                    ),
                    _buildDashboardButton(
                      context,
                      'Quiz',
                      Icons.quiz,
                      Colors.redAccent,
                      QuizScreen(), 
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildDashboardButton(
    BuildContext context, String title, IconData icon, Color color, Widget destination) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

}
