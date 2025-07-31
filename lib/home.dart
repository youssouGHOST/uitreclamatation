import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:reclamation_uit/demande.dart';
import 'signin.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<void> signOut() async {
    try {
      final result = await Amplify.Auth.signOut();
      if (result is CognitoCompleteSignOut) {
        safePrint("Déconnexion réussie");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignInPage()),
        );
      } else if (result is CognitoFailedSignOut) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erreur de déconnexion")),
        );
      }
    } catch (e) {
      safePrint("Erreur lors de la déconnexion : $e");
    }
  }

  void _onItemTapped(int index) async {
    switch (index) {
      case 0:
        // Tu peux ajouter ici une navigation vers "FaireDemande" si besoin
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Demande()),
        );
        break;
      case 2:
        await signOut();
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bienvenue"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 141, 255),
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/bienn.jpg'),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),
              const Text(
                "Bienvenue Youssou, dans votre espace de demande de réclamation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "Que souhaitez-vous faire aujourd'hui ?",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Exemple : aller vers FaireDemande
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => const FaireDemande()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 47, 141, 255),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.purpleAccent.withOpacity(0.6),
                      elevation: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/demande.png', width: 48, height: 48),
                        const SizedBox(width: 12),
                        const Text(
                          "Faire une demande",
                          style: TextStyle(
                            fontSize: 18,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                color: Colors.purpleAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Demande()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 47, 141, 255),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      shadowColor:
                          const Color.fromARGB(175, 36, 127, 255).withOpacity(0.6),
                      elevation: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/vdemande.png', width: 48, height: 48),
                        const SizedBox(width: 12),
                        const Text("Voir mes demandes", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 242, 242),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 251, 250, 252).withOpacity(0.6),
              blurRadius: 12,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: "Faire demande",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: "Mes demandes",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: "Déconnexion",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
