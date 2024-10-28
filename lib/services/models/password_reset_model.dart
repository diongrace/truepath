// lib/services/models/password_reset_model.dart

class PasswordReset {
  final String email;
  final String password;
  final String passwordConfirmation;
  final String token;

  PasswordReset({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'token': token,
    };
  }
}
