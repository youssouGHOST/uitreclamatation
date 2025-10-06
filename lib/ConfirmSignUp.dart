import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'models/ModelProvider.dart';

class ConfirmSignUpPage extends StatefulWidget {
  final String email;
  final String password;
  final String nom;
  final String prenom;
  final String apogee;
  final String cin;
  final Filiere filiere;
  final Cycle cycle;

  const ConfirmSignUpPage({
    super.key,
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
    required this.apogee,
    required this.cin,
    required this.filiere,
    required this.cycle,
  });

  @override
  State<ConfirmSignUpPage> createState() => _ConfirmSignUpPageState();
}

class _ConfirmSignUpPageState extends State<ConfirmSignUpPage> {
  String code = '';
  bool isLoading = false;

  Future<void> _confirm() async {
    setState(() => isLoading = true);
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: widget.email,
        confirmationCode: code,
      );

      if (result.isSignUpComplete) {
        final signInResult = await Amplify.Auth.signIn(
          username: widget.email,
          password: widget.password,
        );
        final user = await Amplify.Auth.getCurrentUser();
        final ownerEmail = user.username;

        if (signInResult.isSignedIn) {
          final newEtudiant = Etudiant(
            nom: widget.nom,
            prenom: widget.prenom,
            apogee: widget.apogee,
            cin: widget.cin,
            cycle: widget.cycle,
            email: widget.email,
            owner: ownerEmail,
            filiere: widget.filiere,
          );

          final response = await Amplify.API.mutate(
            request: ModelMutations.create(newEtudiant),
          ).response;

          if (response.hasErrors) {
            safePrint("Erreur GraphQL : ${response.errors}");
            _showMessage("Erreur lors de l'enregistrement", Colors.redAccent);
          } else {
            _showMessage("Inscription réussie !", Colors.green);
            Navigator.pop(context);
          }
        } else {
          _showMessage("Connexion échouée.", Colors.redAccent);
        }
      } else {
        _showMessage("Confirmation incomplète.", Colors.orange);
      }
    } catch (e) {
      safePrint("Erreur confirmation : $e");
      _showMessage("Erreur : $e", Colors.redAccent);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Image.asset(
                "assets/code.jpg",
                height: 140,
              ),
              const SizedBox(height: 20),
              Text(
                "Vérifie ton e-mail 📩",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Un code a été envoyé à :\n${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (val) => code = val,
                decoration: InputDecoration(
                  labelText: "Code de confirmation",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _confirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Confirmer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Retour à la connexion",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
