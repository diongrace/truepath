import 'package:flutter/material.dart';

class DashboardHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tableau de bord',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color.fromARGB(255, 80, 224, 44),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 153, 2, 246),
        actions: [
          TextButton.icon(
            onPressed: () => _confirmLogout(context),
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 3, 243, 3),
            ),
            label: const Text(
              'Déconnexion',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
        ],
      ),
    );
  }

  // Méthode pour construire l'arrière-plan
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/game.jpeg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
    );
  }

  // Méthode pour construire le contenu de la page
  Widget _buildContent(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône de bienvenue
            const Icon(
              Icons.videogame_asset,
              size: 100,
              color: Color.fromARGB(255, 8, 222, 18), // Couleur contrastée
            ),
            const SizedBox(height: 20),
            // Texte de bienvenue
            const Text(
              'Bienvenue dans l\'application de jeux bibliques !',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Bouton pour accéder aux jeux
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/games');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 166, 0, 255),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.white, width: 2), // Bordure blanche
                ),
                elevation: 5, // Ombre pour effet de profondeur
              ),
              child: const Text(
                'Accéder aux jeux',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Ajout d'un bouton pour d'autres fonctionnalités
            ElevatedButton(
              onPressed: () {
                // Naviguer vers une autre page ou effectuer une action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 193, 7), // Couleur contrastée
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.white, width: 2),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Autres fonctionnalités',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Ajout d'une section d'informations supplémentaires
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  // Méthode pour construire une section d'informations supplémentaires
  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Fond semi-transparent
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Text(
        'Explorez et jouez à des jeux qui enrichissent vos connaissances bibliques.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Méthode pour confirmer la déconnexion
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la déconnexion'),
          content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _logout(context);
              },
              child: const Text('Déconnexion'),
            ),
          ],
        );
      },
    );
  }

  // Méthode pour gérer la déconnexion
  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
