import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Biblique'),
        backgroundColor: Colors.deepPurple,
        elevation: 8.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Choisissez un quiz:',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildQuizTile(
                      context,
                      'Quiz sur l\'Ancien Testament',
                      Icons.assignment,
                      'assets/images/quiz_thumbnail1.jpg',
                      'Testez vos connaissances sur l\'Ancien Testament avec ce quiz passionnant.',
                    ),
                    _buildQuizTile(
                      context,
                      'Quiz sur le Nouveau Testament',
                      Icons.assignment,
                      'assets/images/quiz_thumbnail2.jpg',
                      'Mettez à l\'épreuve vos connaissances sur le Nouveau Testament avec ce quiz complet.',
                    ),
                    _buildQuizTile(
                      context,
                      'Quiz Général sur la Bible',
                      Icons.assignment,
                      'assets/images/quiz_thumbnail3.jpg',
                      'Un quiz général pour évaluer vos connaissances sur divers aspects de la Bible.',
                    ),
                    // Ajoutez plus de quiz ici
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizTile(
      BuildContext context, String title, IconData icon, String thumbnailPath, String description) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Action de redirection vers la page de détails du quiz
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                thumbnailPath,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: 30,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
