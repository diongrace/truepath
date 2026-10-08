# TruePath — Jeux bibliques

Application mobile **Flutter** pour découvrir la Bible en s'amusant : quiz, puzzles, jeux de mémoire et histoires illustrées.

🔗 **Démo en ligne :** https://diongrace.github.io/truepath/ — cliquez sur **« Essayer sans compte »**

<p align="center">
  <img src="docs/screenshots/connexion.png" width="200" alt="Écran de connexion">
  <img src="docs/screenshots/tableau-de-bord.png" width="200" alt="Tableau de bord">
  <img src="docs/screenshots/jeux.png" width="200" alt="Liste des jeux">
  <img src="docs/screenshots/quiz.png" width="200" alt="Quiz biblique">
  <img src="docs/screenshots/puzzle.png" width="200" alt="Puzzle">
</p>

## Fonctionnalités

- **Authentification** : inscription, connexion et mot de passe oublié, reliés à une API REST Laravel
- **Mode démo** : accès à toute l'application sans compte ni serveur
- **Quiz bibliques** : 5 quiz à choix multiples avec score et barre de progression
- **Puzzles (taquin)** : 2 niveaux (3×3 et 4×4), pièces animées, compteur de coups, mélange toujours solvable
- **Jeux de mémoire** (dont une version animaux) et **jeu de correspondance** de versets
- **Histoires bibliques** illustrées avec page de lecture

## Technologies

| Côté | Outils |
|---|---|
| Mobile | Flutter, Dart, Material 3 |
| Backend | [API Laravel](https://github.com/diongrace/API-LARAVEL) avec authentification par token (Sanctum) |
| Réseau | Package `http`, appels REST en JSON |
| Tests | `flutter_test` (tests de widgets) |

## Architecture

```
lib/
├── main.dart              # Routes et thème global
├── screens/
│   ├── auth/              # Connexion, inscription, mot de passe oublié
│   ├── quiz/              # Les 5 quiz et leur introduction
│   ├── puzzle/            # Sélection et jeu de taquin
│   ├── memoirequiz/       # Jeux de mémoire
│   ├── correspond/        # Jeu de correspondance
│   └── histoires_screen.dart, histoire_detail_screen.dart
└── services/              # Appels à l'API et modèles de données
```

## Lancer le projet

Prérequis : [Flutter](https://docs.flutter.dev/get-started/install) 3.x

```bash
git clone https://github.com/diongrace/truepath.git
cd truepath
flutter pub get
flutter run            # sur un émulateur ou un téléphone
flutter run -d chrome  # dans le navigateur
```

Pour utiliser la vraie connexion, lancez l'[API Laravel](https://github.com/diongrace/API-LARAVEL) (`php artisan serve`) et passez son adresse au build :

```bash
flutter run --dart-define=API_URL=http://192.168.X.X:8000
```

Par défaut, l'émulateur Android utilise `http://10.0.2.2:8000`, et la version web n'appelle aucune API. Sans serveur, utilisez **« Essayer sans compte »**.

Lancer les tests :

```bash
flutter test
```

## Historique

Projet commencé en 2024 pendant ma formation, puis repris en 2026 : ajout du mode démo, réécriture du puzzle (solvabilité, découpage de l'image, écran de victoire), page de lecture des histoires, thème graphique unifié, tests et publication web.

## Auteure

**Grace Audrey Dion** — Développeuse web & mobile
[LinkedIn](https://www.linkedin.com/in/saty-opheliegrace-audrey-dion-515917217/) · [GitHub](https://github.com/diongrace)
