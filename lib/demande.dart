import 'package:flutter/material.dart';

class Demande extends StatelessWidget {
  const Demande({super.key});

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

            // Liste des boutons de demande
            _buildDemandButton(
              context,
              "Justification d'absence",
              'assets/absence.png',
              Colors.deepPurple,
            ),
            const SizedBox(height: 16),
            _buildDemandButton(
              context,
              "changement de filière",
              'assets/change.png',
              Colors.indigo,
            ),
            const SizedBox(height: 16),
            _buildDemandButton(
              context,
              "  Ajout de module",
              'assets/module.png',
              Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildDemandButton(
              context,
              "Anomalie d'inscription",
              'assets/anom.png',
              const Color.fromARGB(255, 6, 21, 243),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemandButton(BuildContext context, String title, String asset, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Naviguer vers un formulaire ou une autre page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Demande : $title")),
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
