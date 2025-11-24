import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    final etudiant = Provider.of<EtudiantProvider>(context).etudiant;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mon Profil"),
        centerTitle: true,
        elevation: 3,
        backgroundColor: const Color(0xFF2F8DFF),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 20),
              _infoCard("Nom", etudiant?.nom ?? ""),
              _infoCard("Prénom", etudiant?.prenom ?? ""),
              _infoCard("Numéro Apogée", etudiant?.apogee ?? ""),
              _infoCard("Filière", etudiant?.filiere?.nomFiliere.name ?? ""),
              _infoCard("Cycle", etudiant?.cycle.name ?? ""),
              _infoCard("Email", etudiant?.email ?? ""),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  // -------------------------------
  // HEADER AVEC AVATAR (même style)
  // -------------------------------
  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue.shade200,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Text(
              "Informations personnelles",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // INFO CARD MODERNE (même style)
  // -------------------------------
  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
