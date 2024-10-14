import 'package:flutter/material.dart';
import 'package:truepath/screens/dashboard_screen.dart';
import 'package:truepath/screens/games_screen.dart';
import 'package:truepath/screens/login_screen.dart';
import 'package:truepath/screens/signup_screen.dart';
import 'package:truepath/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeux Bibliques',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => DashboardHomePage(),
        '/games': (context) => GamesPage(),
        // Ajoutez d'autres routes pour les jeux spécifiques
      },
    );
  }
}
