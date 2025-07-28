import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class ConfirmSignUpPage extends StatefulWidget {
  final String email; // tu peux passer l'email depuis la page signup

  ConfirmSignUpPage({required this.email});

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Inscription confirmée. Connecte-toi !")),
        );
        Navigator.pop(context); // Retour à la page de connexion
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
