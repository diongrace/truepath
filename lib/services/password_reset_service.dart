import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:truepath/services/utils/api_endpoint.dart';

class PasswordResetService {
  // Fonction pour envoyer un lien de réinitialisation de mot de passe
Future<bool> forgotPassword(String email) async {
  try {
    final response = await http.post(
      Uri.parse(ApiEndpoint.passwordForgot),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      print('Reset link sent to $email');
      return true;
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return false; // Retourne false si l'envoi échoue
    }
  } catch (e) {
    print('Error during forgot password request: $e');
    return false; // Retourne false en cas d'erreur
  }
}


  // Fonction pour réinitialiser le mot de passe
  Future<bool> resetPassword(String email, String password, String token) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoint.passwordReset),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
          'password_confirmation': password,
          'token': token,
        }),
      );

      if (response.statusCode == 200) {
        print('Password reset successfully for $email');
        return true;
      } else {
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during password reset request: $e');
      throw e;
    }
  }
}
