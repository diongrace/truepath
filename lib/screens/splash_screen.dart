import 'package:flutter/material.dart';
import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    _navigateToSignUp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _navigateToSignUp() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF512DA8), Color(0xFFD1C4E9)], // Dégradé de couleurs
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'assets/images/dd.png', // Assure-toi que l'image du logo est bien placée dans les assets
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.white, // Couleur du ProgressIndicator
                strokeWidth: 3.0,   // Épaisseur de l'indicateur
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '"Car je connais les projets que j\'ai formés sur vous, dit l\'Éternel, projets de paix et non de malheur, pour vous donner un avenir et de l\'espérance." \n- Jérémie 29:11',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
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
