import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' show SignUpOptions, CognitoUserAttributeKey;
import 'package:amplify_api/amplify_api.dart';
import 'package:reclamation_uit/ConfirmSignUp.dart';
import 'models/ModelProvider.dart'; // Assure-toi que ta classe Etudiant est bien importée

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String nom = '';
  String prenom = '';
  String apogee = '';
  String cin = '';
  String cycle = '';

  Future<void> _signUp() async {
    try {
      // Étape 1 : Créer l’utilisateur dans Cognito
      final signUpResult = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(userAttributes: {
           CognitoUserAttributeKey.email: email,
        }),
      );

  if (signUpResult.isSignUpComplete) {
  // Étape 2 : Ajouter dans GraphQL
  final newEtudiant = Etudiant(
    nom: nom,
    prenom: prenom,
    apogee: apogee,
    cin: cin,
    cycle: cycle,
    email: email,
  );

  await Amplify.API.mutate(
    request: ModelMutations.create(newEtudiant),
  ).response;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Inscription réussie")),
  );

  Navigator.pop(context); // Retour à login
} else {
  // 🔁 Naviguer vers la page de confirmation
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ConfirmSignUpPage(email: email),
    ),
  );
}

    } catch (e) {
      safePrint("Erreur inscription : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inscription Étudiant")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            for (var field in [
              {'label': 'Email', 'onChanged': (v) => email = v},
              {'label': 'Mot de passe', 'onChanged': (v) => password = v},
              {'label': 'Nom', 'onChanged': (v) => nom = v},
              {'label': 'Prénom', 'onChanged': (v) => prenom = v},
              {'label': 'CIN', 'onChanged': (v) => cin = v},
              {'label': 'Apogée', 'onChanged': (v) => apogee = v},
              {'label': 'Cycle', 'onChanged': (v) => cycle = v},
            ])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  obscureText: field['label'] == 'Mot de passe',
                  onChanged: field['onChanged'] as void Function(String),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text("S’inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
