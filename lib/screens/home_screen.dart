import 'package:flutter/material.dart';
import 'package:truepath/screens/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aventures Bibliques'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 4.0,
      ),
      body: Container(
         decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/ciel.jpeg'),
           fit: BoxFit.cover,
        ),
         ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon(
              //   Icons.book,
              //   size: 100,
              //   color: Colors.white.withOpacity(0.8),
              // ),
              const SizedBox(height: 20),
              Text(
                'Bienvenue dans notre jeu de la Bible !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(userName: ''),
                  ),
                );
              },
                child: const Text('Commencer'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
