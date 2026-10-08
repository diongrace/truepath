import 'package:flutter/foundation.dart';

class ApiEndpoint {
  // Adresse de l'API Laravel, choisie au moment du build :
  //   flutter run --dart-define=API_URL=http://192.168.X.X:8000
  // Sans valeur : 10.0.2.2 (l'ordinateur vu depuis l'émulateur Android) sur mobile,
  // et aucune API sur le web, pour ne pas appeler le réseau local du visiteur.
  static const mainDomain = String.fromEnvironment(
    'API_URL',
    defaultValue: kIsWeb ? '' : 'http://10.0.2.2:8000',
  );

  static bool get isConfigured => mainDomain.isNotEmpty;

  // Endpoints d'authentification
  static const String inscriptionUser = "$mainDomain/api/auth/register";
  static const String connexionUser = "$mainDomain/api/auth/login";
  static const String passwordForgot = "$mainDomain/api/auth/forgot-password";
  static const String passwordReset = "$mainDomain/api/auth/reset-password";

  // Optionnel: Vous pouvez également ajouter d'autres endpoints ici si nécessaire
  static const String userProfile = "$mainDomain/api/user/profile";

  // Remplace Uri.parse : refuse l'appel si aucune API n'est configurée
  static Uri parse(String url) {
    if (!isConfigured) {
      throw StateError('Aucune API configurée (API_URL)');
    }
    return Uri.parse(url);
  }
}
