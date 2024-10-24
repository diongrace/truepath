import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:truepath/services/models/user_model.dart';
import 'package:truepath/services/utils/api_endpoint.dart';


class ApiService {
  // Fonction pour s'inscrire
   Future<Map<String, dynamic>> signUp(User user) async {
    final response = await http.post(
      Uri.parse(ApiEndpoint.inscriptionUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return {
        'success': true,
        'message': 'Inscription réussie',
      };
    } else {
      print('Erreur lors de l\'inscription: ${response.body}');
      return {
        'success': false,
        'message': response.body,
      };
    }
  }

 // Fonction pour connecter un utilisateur
Future<bool> login(String email, String password) async {
  final response = await http.post(
    Uri.parse(ApiEndpoint.connexionUser),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Connexion réussie, vous pouvez également traiter la réponse ici si nécessaire
    return true;  // Connexion réussie
  } else {
    // En cas d'erreur, vous pouvez afficher les détails ou gérer les erreurs
    print('Erreur lors de la connexion: ${response.body}');
    return false; // Connexion échouée
  }
}

}
