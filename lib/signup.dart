import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'ConfirmSignUp.dart';
import 'models/ModelProvider.dart';

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
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final signUpResult = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(userAttributes: {
          CognitoUserAttributeKey.email: email,
        }),
      );

      if (signUpResult.isSignUpComplete) {
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

        Navigator.pop(context);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ConfirmSignUpPage(
              email: email,
              password: password,
              nom: nom,
              prenom: prenom,
              apogee: apogee,
              cin: cin,
              cycle: cycle,
            ),
          ),
        );
      }
    } catch (e) {
      safePrint("Erreur inscription : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomLeft, child: Image.asset("assets/bottom1.png")),

            Align(alignment: Alignment.topCenter, child: Padding(padding: const EdgeInsets.all(10), child: Image.asset('assets/ibn.png', width: 120))),
            Align(alignment: Alignment.topRight, child: Image.asset('assets/login_img.png', width: 100)),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "",
                        style: TextStyle(
                          color: Color.fromARGB(255, 39, 129, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Courier',
                          shadows: [
                            Shadow(offset: Offset(2, 2), blurRadius: 4.0, color: Color.fromARGB(66, 0, 0, 0)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              _buildTextField(label: 'Email', icon: Icons.email, onChanged: (v) => email = v),
                              const SizedBox(height: 12),
                              _buildTextField(
                                label: 'Mot de passe',
                                icon: Icons.lock,
                                obscure: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                                onChanged: (v) => password = v,
                              ),
                              const SizedBox(height: 12),
                              _buildTextField(label: 'Nom', icon: Icons.person, onChanged: (v) => nom = v),
                              const SizedBox(height: 12),
                              _buildTextField(label: 'Prénom', icon: Icons.person_outline, onChanged: (v) => prenom = v),
                              const SizedBox(height: 12),
                              _buildTextField(label: 'CIN', icon: Icons.credit_card, onChanged: (v) => cin = v),
                              const SizedBox(height: 12),
                              _buildTextField(label: 'Apogée', icon: Icons.school, onChanged: (v) => apogee = v),
                              const SizedBox(height: 12),
                              _buildTextField(label: 'Cycle', icon: Icons.book, onChanged: (v) => cycle = v),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: _isLoading ? null : _signUp,
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: _isLoading
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : const Text('S’inscrire'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Déjà un compte ? Se connecter"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required void Function(String) onChanged,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: onChanged,
      validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
    );
  }
}
