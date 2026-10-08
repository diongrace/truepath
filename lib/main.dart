import 'package:flutter/material.dart';
import 'package:truepath/screens/auth/password_screen.dart';
import 'package:truepath/screens/correspond/MatchingGame_Screen.dart';
import 'package:truepath/screens/dashboard_screen.dart';
import 'package:truepath/screens/games_screen.dart';
import 'package:truepath/screens/histoires_screen.dart';
import 'package:truepath/screens/auth/login_screen.dart';
import 'package:truepath/screens/memoirequiz/MemoryGame_Screen.dart';
import 'package:truepath/screens/memoirequiz/memory_game_animals_screen.dart';
import 'package:truepath/screens/memoirequiz/memory_game_screen.dart';
import 'package:truepath/screens/messager_screen.dart';
import 'package:truepath/screens/puzzle/puzzle_selection_screen.dart';
import 'package:truepath/screens/quiz/quiz2_screen.dart';
import 'package:truepath/screens/quiz/quiz3_screen.dart';
import 'package:truepath/screens/quiz/quiz4_screen.dart';
import 'package:truepath/screens/quiz/quiz5_screen.dart';
import 'package:truepath/screens/quiz/quiz1_screen.dart';
import 'package:truepath/screens/quiz/quizintro_screen.dart';
import 'package:truepath/screens/auth/signup_screen.dart';
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
      // Thème commun : violet en couleur principale, doré pour les accents
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple.shade800,
          primary: Colors.purple.shade800,
          secondary: Colors.amber,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade800,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/password': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardHomePage(),
        '/games': (context) => GamesPage(),
        '/histoires': (context) => const HistoiresScreen(),
        '/quiz1': (context) => QuizPage1(),
        '/quiz2': (context) => QuizPage2(),
        '/quiz3': (context) => QuizPage3(),
        '/quiz4': (context) => QuizPage4(),
        '/quiz5': (context) => QuizPage5(),
        '/quizintro': (context) => QuizIntroPage(),
        '/puzzle_game': (context) => const PuzzleSelectionScreen(),
        '/memory_game': (context) => HomePage(),
        '/MemoryGame': (context) => MemoryGameScreen(),
        '/MatchingGame': (context) => MatchingGameScreen(),
        '/MemoryGameAnimals': (context) => MemoryGameAnimalsScreen(),
        '/messager': (context) => QuizSuccessPage(score: 10, onPlayAgain: () {  }, totalQuizzes: 5, currentQuizIndex: 5,), 
      },
    );
  }
}