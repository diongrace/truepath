import 'package:flutter/material.dart';
import 'package:truepath/services/password_reset_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  final PasswordResetService _passwordResetService = PasswordResetService();

  void _submitForgotPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      final email = _emailController.text;
      bool success = await _passwordResetService.forgotPassword(email);

      setState(() {
        _isSubmitting = false; 
      });
      _showDialog(success);
      _emailController.clear();
    }
  }

  void _showDialog(bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Succès' : 'Erreur', style: const TextStyle(color: Colors.purple)),
          content: Text(success
              ? 'Si un compte existe pour cet email, un email de récupération a été envoyé.'
              : 'Erreur lors de l\'envoi de l\'email de récupération.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de Passe Oublié'),
        backgroundColor: Colors.purple, // Couleur violette pour la barre d'application
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[100]!, Colors.white], // Dégradé de fond
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20), // Ajout d'espace en haut
              const Text(
                'Veuillez entrer votre adresse email pour réinitialiser votre mot de passe.',
                style: TextStyle(fontSize: 18, color: Colors.purple, fontWeight: FontWeight.bold), // Texte violet
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 32), // Ajout d'espace
              _buildEmailInput(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForgotPassword,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple, // Couleur du bouton
                  padding: const EdgeInsets.symmetric(vertical: 16), // Padding vertical du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Coins arrondis
                  ),
                  elevation: 5, // Ombre pour donner un effet de profondeur
                ),
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white) // Indicateur de progression blanc
                    : const Text('Envoyer un lien de réinitialisation', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 250, 250), // Fond de l'input
        borderRadius: BorderRadius.circular(30), // Coins arrondis
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Décalage de l'ombre
          ),
        ],
      ),
      child: TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.purple), // Label violet
          border: InputBorder.none, // Supprime la bordure par défaut
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding interne
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer un email';
          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Veuillez entrer un email valide';
          }
          return null;
        },
      ),
    );
  }
}
