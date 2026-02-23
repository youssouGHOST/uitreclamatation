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

  // Définition des couleurs pour le thème moderne Bleu/Blanc
  static const Color primaryBlue = Color(0xFF2563EB); // Bleu royal
  static const Color lightBlueBg = Color(0xFFF0F4F8); // Fond clair bleuté
  static const Color inputFillColor = Color(0xFFF8FAFC); // Fond des champs
  static const Color textDark = Color(0xFF1E293B); // Texte sombre

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
        authorizationMode: APIAuthorizationType.apiKey,
        apiName: "reclamationuit",
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
        SnackBar(
          content: Text("Veuillez choisir un cycle et une filière"),
          backgroundColor: Colors.red.shade400,
        ),
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
          SnackBar(
            content: Text("Inscription réussie"),
            backgroundColor: Colors.green,
          ),
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
        SnackBar(
          content: Text("Erreur : $e"),
          backgroundColor: Colors.red.shade400,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueBg,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryBlue,
        title: Text(
          "Inscription",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo / Icône en haut
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.school,
                        size: 50,
                        color: primaryBlue,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Créer un compte",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Veuillez remplir les informations ci-dessous",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                    SizedBox(height: 32),

                    // Champs de texte
                    _buildTextField(
                      label: 'Email',
                      icon: Icons.email_outlined,
                      onChanged: (v) => email = v,
                      validator: _validateEmail,
                    ),
                    _buildTextField(
                      label: 'Mot de passe',
                      icon: Icons.lock_outline,
                      obscure: _obscurePassword,
                      onChanged: (v) => password = v,
                      validator: _validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey.shade500,
                        ),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            label: 'Nom',
                            icon: Icons.person_outline,
                            onChanged: (v) => nom = v,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            label: 'Prénom',
                            icon: Icons.person_outline,
                            onChanged: (v) => prenom = v,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            label: 'CIN',
                            icon: Icons.badge_outlined,
                            onChanged: (v) => cin = v,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            label: 'Apogée',
                            icon: Icons.numbers,
                            onChanged: (v) => apogee = v,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Sélecteurs (Cycle et Filière)
                    _buildDropdownCycle(),
                    SizedBox(height: 16),
                    _buildDropdownFiliere(),
                    
                    SizedBox(height: 32),

                    // Bouton d'inscription
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Icon(icon, color: primaryBlue),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: inputFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: primaryBlue, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        onChanged: onChanged,
        validator: validator ??
            (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
      ),
    );
  }

  Widget _buildDropdownCycle() {
    return DropdownButtonFormField<Cycle>(
      decoration: InputDecoration(
        labelText: "Cycle",
        labelStyle: TextStyle(color: Colors.grey.shade700),
        prefixIcon: Icon(Icons.layers_outlined, color: primaryBlue),
        filled: true,
        fillColor: inputFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryBlue, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      value: cycle,
      items: Cycle.values
          .map((c) => DropdownMenuItem(
                value: c,
                child: Text(
                  c.name,
                  style: TextStyle(color: textDark),
                ),
              ))
          .toList(),
      onChanged: (value) => setState(() => cycle = value),
      validator: (value) => value == null ? "Choisissez un cycle" : null,
      isExpanded: true,
      icon: Icon(Icons.arrow_drop_down_circle, color: primaryBlue),
    );
  }

  Widget _buildDropdownFiliere() {
    return isLoadingFilieres
        ? Center(child: CircularProgressIndicator(color: primaryBlue))
        : DropdownButtonFormField<Filiere>(
            decoration: InputDecoration(
              labelText: "Filière",
              labelStyle: TextStyle(color: Colors.grey.shade700),
              prefixIcon: Icon(Icons.account_balance_outlined, color: primaryBlue),
              filled: true,
              fillColor: inputFillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: primaryBlue, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
            value: selectedFiliere,
            items: filieres
                .map((f) => DropdownMenuItem(
                      value: f,
                      child: Text(
                        f.nomFiliere.name,
                        style: TextStyle(color: textDark),
                      ),
                    ))
                .toList(),
            onChanged: (value) => setState(() => selectedFiliere = value),
            validator: (value) => value == null ? "Choisissez une filière" : null,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down_circle, color: primaryBlue),
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
    if (value.length < 6) return "6 caractères minimum";
    return null;
  }
}