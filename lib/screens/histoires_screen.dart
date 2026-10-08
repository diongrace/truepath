import 'package:flutter/material.dart';
import 'package:truepath/screens/histoire_detail_screen.dart';

// Une histoire biblique : titre, image, résumé court et texte complet
class Histoire {
  final String titre;
  final String image;
  final String resume;
  final String texte;

  const Histoire({
    required this.titre,
    required this.image,
    required this.resume,
    required this.texte,
  });
}

const List<Histoire> histoires = [
  Histoire(
    titre: 'Le jardin d\'Éden',
    image: 'assets/images/puzzle_7.png',
    resume: 'Adam et Ève dans le jardin que Dieu a créé pour eux.',
    texte:
        'Au commencement, Dieu créa le ciel et la terre. Il forma l\'homme, Adam, '
        'et le plaça dans un magnifique jardin appelé Éden, rempli d\'arbres, de fruits et d\'animaux.\n\n'
        'Dieu lui donna une compagne, Ève. Ils pouvaient manger de tous les arbres du jardin, '
        'sauf de l\'arbre de la connaissance du bien et du mal.\n\n'
        'Le serpent, rusé, convainquit Ève de goûter le fruit défendu, et elle en donna à Adam. '
        'Ayant désobéi, ils durent quitter le jardin. Mais Dieu ne les abandonna pas : '
        'il continua de veiller sur eux et sur leurs descendants.',
  ),
  Histoire(
    titre: 'L\'Arche de Noé',
    image: 'assets/images/puzzle_2.png',
    resume: 'L\'histoire de la grande inondation et de l\'arche de Noé.',
    texte:
        'Les hommes étaient devenus mauvais, mais Noé restait juste et fidèle à Dieu. '
        'Dieu lui demanda de construire une grande arche en bois.\n\n'
        'Noé y fit entrer sa famille et un couple de chaque espèce d\'animaux. '
        'Puis la pluie tomba pendant quarante jours et quarante nuits, et l\'eau recouvrit toute la terre.\n\n'
        'Quand les eaux baissèrent, Noé lâcha une colombe qui revint avec un rameau d\'olivier. '
        'Tous sortirent de l\'arche, et Dieu plaça un arc-en-ciel dans le ciel, '
        'signe de sa promesse de ne plus jamais détruire la terre par un déluge.',
  ),
  Histoire(
    titre: 'L\'Histoire de Moïse',
    image: 'assets/images/puzzle_3.png',
    resume: 'Découvrez comment Moïse a conduit le peuple d\'Israël hors d\'Égypte.',
    texte:
        'Le peuple d\'Israël vivait en esclavage en Égypte. Dieu appela Moïse '
        'depuis un buisson ardent pour qu\'il libère son peuple.\n\n'
        'Pharaon refusa, et dix plaies frappèrent l\'Égypte avant qu\'il ne cède. '
        'Le peuple partit, mais Pharaon changea d\'avis et le poursuivit. '
        'Dieu ouvrit alors la mer Rouge pour laisser passer Israël à pied sec.\n\n'
        'Dans le désert, sur le mont Sinaï, Dieu remit à Moïse les tables de la Loi '
        'portant les dix commandements, pour guider son peuple.',
  ),
];

class HistoiresScreen extends StatelessWidget {
  const HistoiresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histoires'),
        backgroundColor: Colors.purple.shade800,
        foregroundColor: Colors.white,
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
                    color: Colors.purple.shade800,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (final histoire in histoires) _buildStoryTile(context, histoire),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryTile(BuildContext context, Histoire histoire) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoireDetailScreen(histoire: histoire),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Image.asset(
              histoire.image,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    histoire.titre,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    histoire.resume,
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
            Icon(Icons.chevron_right, color: Colors.purple.shade800),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
