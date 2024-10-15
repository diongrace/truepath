import 'package:flutter/material.dart';
import 'package:truepath/screens/dashboard_screen.dart';
import 'package:truepath/screens/games_screen.dart';
import 'package:truepath/screens/login_screen.dart';
import 'package:truepath/screens/quiz2_screen.dart';
import 'package:truepath/screens/quiz3_screen.dart';
import 'package:truepath/screens/quiz4_screen.dart';
import 'package:truepath/screens/quiz5_screen.dart';
import 'package:truepath/screens/quiz_screen.dart';
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
        '/quiz': (context) => QuizPage(),
        '/quiz2': (context) => QuizPage2(),
        '/quiz3': (context) => QuizPage3(),
        '/quiz4': (context) => QuizPage4(),
        '/quiz5': (context) => QuizPage5(),
        '/messager': (context) => QuizSuccessPage(score: 10, onPlayAgain: () {  },), 
      },
    );
  }
}
