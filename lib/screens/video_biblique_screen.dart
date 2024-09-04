import 'package:flutter/material.dart';

class VideoBibliqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vidéo Biblique'),
        backgroundColor: Colors.deepPurple,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sélectionnez une vidéo:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildVideoTile(
                    context,
                    'Vidéo 1: Introduction à la Bible',
                    'assets/images/video_thumbnail1.jpg',
                    'Durée: 15 min',
                  ),
                  _buildVideoTile(
                    context,
                    'Vidéo 2: L\'Histoire de Jésus',
                    'assets/images/video_thumbnail2.jpg',
                    'Durée: 20 min',
                  ),
                  _buildVideoTile(
                    context,
                    'Vidéo 3: Les Paraboles de Jésus',
                    'assets/images/video_thumbnail3.jpg',
                    'Durée: 25 min',
                  ),
                  // Ajoutez plus de vidéos ici
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTile(
      BuildContext context, String title, String thumbnailPath, String duration) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Action de redirection vers la page de lecture de vidéo
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                thumbnailPath,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    duration,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
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
