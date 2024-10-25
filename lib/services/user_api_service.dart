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
    try {
      // Appel à votre API pour se connecter
      final response = await http.post(
        Uri.parse(ApiEndpoint.connexionUser),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Si la connexion est réussie
        return true;
      } else {
        // Si la connexion échoue, vous pouvez renvoyer false ou lever une exception
        return false;
      }
    } catch (e) {
      // Gérer les exceptions ici
      print("Erreur lors de la connexion: $e");
      throw e; // Relève l'erreur pour pouvoir la gérer plus haut
    }
  }

}
