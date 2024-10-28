class ApiEndpoint {
  // Adresse IP spécifique selon le cas : localhost pour Android ou IP locale pour appareil réel
  static const address = "10.0.2.2"; // Utilisez cette IP si vous travaillez avec un émulateur Android
  // Si vous êtes sur un appareil réel, remplacez par l'IP locale de votre machine :
  // static const address = "192.168.X.X"; 

  static const port = 8000; // Le port de votre API Laravel (par défaut 8000 pour PHP artisan serve)
  static const mainDomain = "http://$address:$port"; 

  // Endpoints d'authentification
  static const String inscriptionUser = "$mainDomain/api/auth/register";  
  static const String connexionUser = "$mainDomain/api/auth/login";  
  static const String passwordForgot = "$mainDomain/api/auth/forgot-password"; 
  static const String passwordReset = "$mainDomain/api/auth/reset-password";

  // Optionnel: Vous pouvez également ajouter d'autres endpoints ici si nécessaire
  static const String userProfile = "$mainDomain/api/user/profile"; 
}
