class ApiEndpoint {
  static const address = "127.0.0.1";
  static const port = 3000; 
  static const mainDomain = "http://$address:$port"; 

  // Authentification
  static const String inscriptionUser = "$mainDomain/api/users/signup";  
  static const String connexionUser = "$mainDomain/api/users/login";  
}
