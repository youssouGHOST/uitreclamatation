import 'package:flutter/material.dart';
import 'package:reclamation_uit/FormulaireAbsence.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/DemandeAttestation.dart';
import 'package:reclamation_uit/DemandeAnnulation.dart';
import 'package:reclamation_uit/FormulaireAnomalie.dart';
import 'package:reclamation_uit/FormulaireAjoutModule.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';

class Demande extends StatefulWidget {
  const Demande({super.key});

  @override
  State<Demande> createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  // Définition des couleurs pour le thème moderne Bleu/Blanc
  static const Color primaryBlue = Color(0xFF2563EB); // Bleu royal
  static const Color lightBlueBg = Color(0xFFF0F4F8); // Fond clair bleuté
  static const Color textDark = Color(0xFF1E293B); // Texte sombre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueBg,
      appBar: AppBar(
        title: const Text("Types de demandes"),
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
                  const Text(
                    "Sélectionnez le type",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "de demande souhaitée :",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  
                  _buildDemandButton(
                    context,
                    "Justification d'absence",
                    'assets/absence.png',
                    const FormulaireAbsence(),
                  ),
                  const SizedBox(height: 16),
                  
                  _buildDemandButton(
                    context,
                    "Attestation d'inscription",
                    'assets/change.png',
                    const DemandeAttestation(),
                  ),
                  const SizedBox(height: 16),
                  
                  _buildDemandButton(
                    context,
                    "Annulation d'inscription",
                    'assets/image.png',
                    const DemandeAnnulation(),
                  ),
                  const SizedBox(height: 16),
                  
                  _buildDemandButton(
                    context,
                    "Signaler une anomalie",
                    'assets/image.png',
                    const FormulaireAnomalie(),
                  ),
                  const SizedBox(height: 16),
                  
                  _buildDemandButton(
                    context,
                    "Ajouter un module",
                    'assets/image.png',
                    const FormulaireAjoutModule(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _buildDemandButton(
    BuildContext context,
    String title,
    String asset,
    Widget destinationPage,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destinationPage),
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
            Image.asset(asset, width: 28, height: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}