import 'package:flutter/material.dart';

class EtudeBibliqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Étude Biblique'),
        backgroundColor: Colors.deepPurple,
        elevation: 8.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Explorez nos études bibliques:',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildStudyTile(
                    context,
                    'L\'Évangile selon Matthieu',
                    Icons.library_books,
                    'assets/images/study_thumbnail1.jpg',
                    'Une étude approfondie de l\'Évangile selon Matthieu, comprenant les enseignements clés et les contextes historiques.',
                  ),
                  _buildStudyTile(
                    context,
                    'L\'Évangile selon Jean',
                    Icons.library_books,
                    'assets/images/study_thumbnail2.jpg',
                    'Analyse de l\'Évangile selon Jean, avec une attention particulière portée sur les miracles et les discours de Jésus.',
                  ),
                  _buildStudyTile(
                    context,
                    'Les Épîtres de Paul',
                    Icons.library_books,
                    'assets/images/study_thumbnail3.jpg',
                    'Un regard sur les épîtres écrites par Paul, comprenant les lettres aux Romains, Corinthiens, et plus encore.',
                  ),
                  // Ajoutez plus d'études bibliques ici
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyTile(
      BuildContext context, String title, IconData icon, String thumbnailPath, String description) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Action de redirection vers la page de détails de l'étude
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: 30,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 18,
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
                    maxLines: 2,
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
