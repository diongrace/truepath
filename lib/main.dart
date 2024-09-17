import 'package:flutter/material.dart';
import 'package:truepath/screens/dashboard_screen.dart';
import 'package:truepath/screens/etude_biblique_screen.dart';
import 'package:truepath/screens/histoires_screen.dart';
import 'package:truepath/screens/home_screen.dart';
import 'package:truepath/screens/quiz_screen.dart';
import 'package:truepath/screens/signup_screen.dart';
import 'package:truepath/screens/splash_screen.dart';
import 'package:truepath/screens/video_biblique_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) =>  SignUpScreen(),
        '/dashboard': (context) => const DashboardScreen(userName: ''),
          '/histoires': (context) => HistoiresScreen(),
        '/etude_biblique': (context) => EtudeBibliqueScreen(),
        '/video_biblique': (context) => VideoBibliqueScreen(),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}
