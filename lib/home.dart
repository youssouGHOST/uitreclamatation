import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:reclamation_uit/demande.dart';
import 'package:reclamation_uit/DashbordPage.dart';
import 'signin.dart';
import './widget/CustomBottomNav.dart';
import 'profil.dart';
import 'package:provider/provider.dart';

import 'provider/EtudiantProvider.dart'; // chemin vers ton provider

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
        final etudiant = Provider.of<EtudiantProvider>(context).etudiant;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bienvenue"),
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
               Text(  
                "Bienvenue ${etudiant?.nom ?? ''}" " ${etudiant?.prenom ?? ''} , dans votre espace de demande de réclamation",
                style: TextStyle(
                  fontSize: 20,
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
                       Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage( etudiant:etudiant!)));
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
                        Image.asset('assets/vdemande.png', width: 48, height: 48),
                        const SizedBox(width: 12),
                        const Text(
                          "voir mes demandes",
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
                        Image.asset('assets/demande.png', width: 48, height: 48),
                        const SizedBox(width: 12),
                        const Text("faire une demande", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
              bottomNavigationBar: CustomBottomNav(), // ✅ insertion

    );
  }
}
