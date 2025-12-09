import 'package:flutter/material.dart';
import 'package:reclamation_uit/FormulaireAbsence.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/DemandeAttestation.dart';

import 'package:reclamation_uit/widget/CustomBottomNav.dart';
class Demande extends StatefulWidget {
  const Demande({super.key});

  @override
  State<Demande> createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Types de demandes"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 141, 255),
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "Sélectionnez le type de demande que vous souhaitez effectuer :",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildDemandButton(
              context,
              "Justification d'absence",
              'assets/absence.png',
              Colors.deepPurple,
            const  FormulaireAbsence(),    
               ),
            const SizedBox(height: 16),
            _buildDemandButton(
              context,
              "Attestation d'inscription",
              'assets/change.png',
              Colors.indigo,
              const DemandeAttestation(),
            ),
           
          ],
        ),
      ),
            bottomNavigationBar: CustomBottomNav(), // ✅ insertion

    );
  }

  Widget _buildDemandButton(
    BuildContext context,
    String title,
    String asset,
    Color color,
    Widget destinationPage,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => destinationPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 8,
          shadowColor: color.withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, width: 36, height: 36),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    offset: Offset(0, 0),
                    blurRadius: 8,
                    color: Colors.black26,
                  )
                ],
              ),
            ),
          ],
        ),
        
      ),
      
    );
    
  }
}
