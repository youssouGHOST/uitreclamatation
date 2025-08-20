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
  Cycle? cycle;
  Filiere? selectedFiliere;

  bool _obscurePassword = true;
  bool _isLoading = false;
  bool isLoadingFilieres = true;
  List<Filiere> filieres = [];

  @override
  void initState() {
    super.initState();
    _fetchFilieres();
  }

  Future<void> _fetchFilieres() async {
    setState(() => isLoadingFilieres = true);
    try {
      final request = ModelQueries.list(
        Filiere.classType,
        authorizationMode: APIAuthorizationType.apiKey, // 🔹 lecture publique
      );

      final response = await Amplify.API.query(request: request).response;

      if (response.data != null) {
        setState(() {
          filieres = response.data!.items.whereType<Filiere>().toList();
          isLoadingFilieres = false;
        });
      } else if (response.errors.isNotEmpty) {
        safePrint("GraphQL errors: ${response.errors}");
        setState(() => isLoadingFilieres = false);
      }
    } catch (e) {
      safePrint("Erreur récupération filières : $e");
      setState(() => isLoadingFilieres = false);
    }
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedFiliere == null || cycle == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez choisir un cycle et une filière")),
      );
      return;
    }

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
              filiere: selectedFiliere!,
              cycle: cycle!,
            ),
          ),
        );
      }
    } catch (e) {
      safePrint("Erreur inscription : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inscription")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                  label: 'Email',
                  icon: Icons.email,
                  onChanged: (v) => email = v,
                  validator: _validateEmail),
              _buildTextField(
                label: 'Mot de passe',
                icon: Icons.lock,
                obscure: _obscurePassword,
                onChanged: (v) => password = v,
                validator: _validatePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              _buildTextField(label: 'Nom', icon: Icons.person, onChanged: (v) => nom = v),
              _buildTextField(label: 'Prénom', icon: Icons.person, onChanged: (v) => prenom = v),
              _buildTextField(label: 'CIN', icon: Icons.credit_card, onChanged: (v) => cin = v),
              _buildTextField(label: 'Apogée', icon: Icons.school, onChanged: (v) => apogee = v),
              SizedBox(height: 16),

              DropdownButtonFormField<Cycle>(
                decoration: InputDecoration(labelText: "Cycle"),
                value: cycle,
                items: Cycle.values
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                    .toList(),
                onChanged: (value) => setState(() => cycle = value),
                validator: (value) => value == null ? "Choisissez un cycle" : null,
                isExpanded: true,
              ),
              SizedBox(height: 16),

              isLoadingFilieres
                  ? CircularProgressIndicator()
                  : DropdownButtonFormField<Filiere>(
                      decoration: InputDecoration(labelText: "Filière"),
                      value: selectedFiliere,
                      items: filieres
                          .map((f) => DropdownMenuItem(
                                value: f,
                                child: Text(f.nomFiliere.name),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => selectedFiliere = value),
                      validator: (value) => value == null ? "Choisissez une filière" : null,
                      isExpanded: true,
                    ),
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: _isLoading ? null : _signUp,
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                child: _isLoading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required void Function(String) onChanged,
    bool obscure = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        validator: validator ?? (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Champ requis";
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) return "Email invalide";
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Champ requis";
    if (value.length < 6) return "Mot de passe trop court (6 caractères minimum)";
    return null;
  }
}
