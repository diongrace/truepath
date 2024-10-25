class User {
  final String nom; // Nom de l'utilisateur
  final String prenom; // Prénom de l'utilisateur
  final String email; // Email de l'utilisateur
  final String password; // Mot de passe de l'utilisateur
  final String passwordConfirmation; // Confirmation du mot de passe

  // Constructeur de la classe User
  User({
    required this.nom, // Ajout du nom dans le constructeur
    required this.prenom, // Ajout du prénom dans le constructeur
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  // Méthode pour convertir l'utilisateur en JSON
  Map<String, dynamic> toJson() {
    return {
      'nom': nom, // Ajout du nom dans le JSON
      'prenom': prenom, // Ajout du prénom dans le JSON
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
