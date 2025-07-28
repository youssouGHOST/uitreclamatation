import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:another_flushbar/flushbar.dart';
import 'models/ModelProvider.dart';
import 'home.dart';
import 'signup.dart';

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

  void _showTopFlushbar(String message) {
    Flushbar(
      message: message,
      backgroundColor: const Color.fromARGB(255, 117, 7, 190),
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
      //-------------------------------------------------------
      print("Résultat connexion : ${res.isSignedIn}");

      final etudiant = await _fetchEtudiant(email);
      print("Étudiant récupéré : $etudiant");
      //
      if (res.isSignedIn) {
        final etudiant = await _fetchEtudiant(email);
        if (etudiant != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
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

  Future<AuthUser> getCurrentUser() async {
  final user = await Amplify.Auth.getCurrentUser();
  return user;
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
            Align(alignment: Alignment.topCenter, child: Padding(padding: const EdgeInsets.all(10), child: Image.asset('assets/ibn.png', width: 200))),
            Align(alignment: Alignment.topRight, child: Image.asset('assets/login_img.png', width: 100)),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Faculté des sciences",
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
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: _isLoading ? null : _signIn,
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text('Se connecter'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                   TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>SignUpPage()));
                      },
                      child: const Text("Créer un compte"),
                    ), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
