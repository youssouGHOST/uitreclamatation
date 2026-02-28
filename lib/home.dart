import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:flutter/material.dart';

import 'package:reclamation_uit/demande.dart';

import 'package:reclamation_uit/DashbordPage.dart';

import 'signin.dart';

import './widget/CustomBottomNav.dart';

import 'profil.dart';

import 'package:provider/provider.dart';

import 'provider/EtudiantProvider.dart';

class HomePage extends StatefulWidget {

const HomePage({super.key});

@override

State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

// Définition des couleurs pour le thème moderne Bleu/Blanc

static const Color primaryBlue = Color(0xFF2563EB); // Bleu royal

static const Color lightBlueBg = Color(0xFFF0F4F8); // Fond clair bleuté

static const Color textDark = Color(0xFF1E293B); // Texte sombre

@override

Widget build(BuildContext context) {

final etudiant = Provider.of<EtudiantProvider>(context).etudiant;
return Scaffold(
  backgroundColor: lightBlueBg,
  appBar: AppBar(
    title: const Text("Accueil"),
    centerTitle: true,
    backgroundColor: primaryBlue,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24),
      ),
    ),
  ),
  body: Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                    Icons.school,
                    size: 80,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 24),
                // Message de bienvenue
                Text(
                  "Bienvenue ${etudiant?.nom ?? ''} ${etudiant?.prenom ?? ''}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "dans votre espace de réclamation",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Bouton Voir mes demandes
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DashboardPage(etudiant: etudiant!),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/vdemande.png', width: 28, height: 28),
                        const SizedBox(width: 12),
                        const Text(
                          "Voir mes demandes",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Bouton Faire une demande
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Demande()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/demande.png', width: 28, height: 28),
                        const SizedBox(width: 12),
                        const Text(
                          "Faire une demande",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
  bottomNavigationBar: CustomBottomNav(),
);
}

}