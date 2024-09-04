import 'package:flutter/material.dart';

class HistoiresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histoires'),
        backgroundColor: Colors.deepPurple,
        elevation: 8.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Découvrez nos histoires bibliques:',
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
                  _buildStoryTile(
                    context,
                    'L\'Histoire de Moïse',
                    Icons.video_library,
                    'assets/images/story_thumbnail1.jpg',
                    'Découvrez comment Moïse a conduit le peuple d\'Israël hors d\'Égypte.',
                  ),
                  _buildStoryTile(
                    context,
                    'L\'Arche de Noé',
                    Icons.video_library,
                    'assets/images/story_thumbnail2.jpg',
                    'L\'histoire de la grande inondation et de l\'arche de Noé.',
                  ),
                  _buildStoryTile(
                    context,
                    'David et Goliath',
                    Icons.video_library,
                    'assets/images/story_thumbnail3.jpg',
                    'L\'épopée de David affrontant le géant Goliath.',
                  ),
                  // Ajoutez plus d'histoires ici
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryTile(
      BuildContext context, String title, IconData icon, String thumbnailPath, String description) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Action de redirection vers la page de détails de l'histoire
        },
        child: Row(
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
            const SizedBox(width: 12),
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
                      const SizedBox(width: 2),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 18,
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
