import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:truepath/services/models/user_model.dart';
import 'package:truepath/services/utils/api_endpoint.dart';


class ApiService {
  Future<bool> signUp(User user) async {
    final response = await http.post(
      Uri.parse(ApiEndpoint.inscriptionUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Erreur lors de l\'inscription: ${response.body}');
      return false;
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
      return true;  // Connexion réussie
    } else {
      print('Erreur lors de la connexion: ${response.body}');
      return false;
    }
  }
}
