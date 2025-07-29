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
  final String cycle;

  ConfirmSignUpPage({
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
    required this.apogee,
    required this.cin,
    required this.cycle,
  });

  @override
  _ConfirmSignUpPageState createState() => _ConfirmSignUpPageState();
}

class _ConfirmSignUpPageState extends State<ConfirmSignUpPage> {
  String code = '';

  Future<void> _confirm() async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: widget.email,
        confirmationCode: code,
      );

      if (result.isSignUpComplete) {
        //  Connexion après confirmation
        final signInResult = await Amplify.Auth.signIn(
          username: widget.email,
          password: widget.password,
        );
        final user = await Amplify.Auth.getCurrentUser();
final ownerEmail = user.username;


        if (signInResult.isSignedIn) {
          //  Ajout dans la base
          final newEtudiant = Etudiant(
            nom: widget.nom,
            prenom: widget.prenom,
            apogee: widget.apogee,
            cin: widget.cin,
            cycle: widget.cycle,
            email: widget.email,
            owner: ownerEmail,

          );

          final response = await Amplify.API.mutate(
            request: ModelMutations.create(newEtudiant),
          ).response;

          if (response.hasErrors) {
            safePrint("Erreur GraphQL : ${response.errors}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Erreur lors de l'enregistrement")),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Inscription réussie !")),
            );
            Navigator.pop(context); // Retour à la page de connexion
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Connexion échouée.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Confirmation incomplète.")),
        );
      }
    } catch (e) {
      safePrint("Erreur confirmation : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmer l'inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Un code a été envoyé à ${widget.email}"),
            TextFormField(
              decoration: InputDecoration(labelText: "Code de confirmation"),
              onChanged: (val) => code = val,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirm,
              child: Text("Confirmer"),
            ),
          ],
        ),
      ),
    );
  }
}
