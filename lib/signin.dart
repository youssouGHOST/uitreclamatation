import 'package:flutter/material.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:provider/provider.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:amplify_api/amplify_api.dart';

import 'package:another_flushbar/flushbar.dart';

import 'models/ModelProvider.dart';

import 'home.dart';

import 'signup.dart';

import 'provider/EtudiantProvider.dart';

class SignInPage extends StatefulWidget {

const SignInPage({super.key});

@override

_SignInPageState createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

bool _obscurePassword = true;

bool _isLoading = false;

// Couleurs du thème moderne

static const Color primaryBlue = Color(0xFF2563EB);

static const Color lightBlueBg = Color(0xFFF0F4F8);

static const Color inputFillColor = Color(0xFFF8FAFC);

static const Color textDark = Color(0xFF1E293B);

void _showTopFlushbar(String message) {

Flushbar(
  message: message,
  backgroundColor: Colors.blue.shade400,
  duration: const Duration(seconds: 2),
  flushbarPosition: FlushbarPosition.TOP,
  margin: const EdgeInsets.all(20),
  borderRadius: BorderRadius.circular(100),
  icon: const Icon(Icons.error, color: Colors.white),
  forwardAnimationCurve: Curves.easeIn,
  reverseAnimationCurve: Curves.easeOut,
).show(context);
}

Future<Etudiant?> _fetchEtudiant(String email) async {

try {
  final request = ModelQueries.list(
    Etudiant.classType,
    where: Etudiant.EMAIL.eq(email),
  );
  final response = await Amplify.API.query(request: request).response;
  return response.data?.items.first;
} catch (e) {
  safePrint("Erreur API : $e");
  return null;
}
}

Future<void> _signIn() async {

setState(() => _isLoading = true);
final email = emailController.text.trim();
final password = passwordController.text.trim();
try {
  final res = await Amplify.Auth.signIn(username: email, password: password);
  print("Résultat connexion : ${res.isSignedIn}");
  if (res.isSignedIn) {
    final etudiant = await _fetchEtudiant(email);
    print("Étudiant récupéré : $etudiant");
    if (etudiant != null) {
      Provider.of<EtudiantProvider>(context, listen: false).setEtudiant(etudiant);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      _showTopFlushbar("Étudiant non trouvé.");
    }
  } else {
    _showTopFlushbar("Échec de la connexion.");
  }
} catch (e, stackTrace) {
  safePrint("Erreur login : $e");
  safePrint("Type d'exception : ${e.runtimeType}");
  safePrint("StackTrace : $stackTrace");
  String errorMessage = "Une erreur inconnue est survenue.";
  if (e is AuthException) {
    errorMessage = e.message;
    safePrint("Message d'erreur : ${e.message}");
    safePrint("Suggestion de récupération : ${e.recoverySuggestion}");
  }
  _showTopFlushbar("Erreur : $errorMessage");
}
setState(() => _isLoading = false);
}

Future<void> _signOut(BuildContext context) async {

try {
  final result = await Amplify.Auth.signOut();
  if (result is CognitoCompleteSignOut) {
    safePrint("✅ Déconnexion réussie");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  } else if (result is CognitoFailedSignOut) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("⚠️ Erreur de déconnexion")),
    );
  }
} catch (e) {
  safePrint("❌ Erreur lors de la déconnexion : $e");
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
      "Université Ibn' Tofail",
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo / Icône
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryBlue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline,
                    size: 50,
                    color: primaryBlue,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Faculté des sciences",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Veuillez vous connecter pour continuer",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                SizedBox(height: 32),
                // Champ Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    prefixIcon: Icon(Icons.email_outlined, color: primaryBlue),
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
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                // Champ Mot de passe
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    prefixIcon: Icon(Icons.lock_outline, color: primaryBlue),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade500,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
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
                ),
                SizedBox(height: 32),
                // Bouton Connexion
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
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
                            "Se connecter",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 24),
                // Lien Inscription
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(color: primaryBlue, fontWeight: FontWeight.w600),
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

}