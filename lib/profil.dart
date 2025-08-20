import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _Profil();
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    final etudiant = Provider.of<EtudiantProvider>(context).etudiant;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Mon Profil"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 141, 255),
        foregroundColor: Colors.white,

        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar circulaire
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade200,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Carte infos
            _buildInfoCard("Nom", etudiant?.nom ?? ''),
            _buildInfoCard("Prénom", etudiant?.prenom ?? ''),
            _buildInfoCard("Numéro Apogée", etudiant?.apogee ?? ''),
            _buildInfoCard("Filière", etudiant?.filiere?.nomFiliere.name ?? ''),
            _buildInfoCard("Cycle", etudiant?.cycle.name ?? ''),
            _buildInfoCard("Email", etudiant?.email ?? ''),


            // Bouton Déconnexion

          ],
        ),
        
      ),
      bottomNavigationBar: CustomBottomNav(), // ✅ insertion

    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.info_outline, color: Colors.blue.shade700),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87)),
      ),
    );
  }
}
