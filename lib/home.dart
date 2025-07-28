import 'package:flutter/material.dart';
import 'models/Etudiant.dart';
import 'package:flutter/material.dart';
//import 'package:reclamation/pages/demande.dart';
// import 'package:reclamation/pages/faire_demande.dart'; // À créer si tu as cette page
// import 'package:reclamation/pages/profil.dart';        // À créer si tu as cette page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation selon l’index
    switch (index) {
      case 0:
        // Faire une demande
        // Navigator.push(context, MaterialPageRoute(builder: (_) => const FaireDemande()));
        break;
      case 1:
        // Voir mes demandes
      //  Navigator.push(context, MaterialPageRoute(builder: (_) => const Demande()));
        break;
      case 2:
        // Profil
        // Navigator.push(context, MaterialPageRoute(builder: (_) => const Profil()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Bienvenue"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 154, 83, 215),
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
          "Bienvenue Youssou ,dans votre espace de demande de réclamation",
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
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
   //     Navigator.push(context, MaterialPageRoute(builder: (_) => const Demande()));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: const Color.fromARGB(255, 154, 83, 215),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          
    shadowColor: Colors.purpleAccent.withOpacity(0.6), // Couleur de l'ombre
    elevation: 10, // Hauteur de l'ombre (plus = plus visible)
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/demande.png', width: 48, height: 48),
            const SizedBox(width: 12),
            const Text("Faire une demande", style: TextStyle(fontSize: 18 ,    shadows: [
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 10,
          color: Colors.purpleAccent, // Effet lumineux sur le texte
        ),
      ],)),
          ],
        ),
      ),
    ),
    const SizedBox(height: 20),
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
        //  Navigator.push(context, MaterialPageRoute(builder: (_) => const Demande()));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: const Color.fromARGB(255, 47, 141, 255),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          
    shadowColor: const Color.fromARGB(175, 36, 127, 255).withOpacity(0.6), // Couleur de l'ombre
    elevation: 10, // Hauteur de l'ombre (plus = plus visible)
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
    ),
  ],
),


      ],
    ),
  ),
),bottomNavigationBar: Container(
  decoration: BoxDecoration(
          color: const Color.fromARGB(255, 154, 83, 215),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 198, 74, 255).withOpacity(0.6),
        blurRadius: 12,
        offset: const Offset(0, -5), // ombre vers le haut
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
      backgroundColor: const Color.fromARGB(0, 31, 30, 30), // transparent car déjà dans un container
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 0, // on laisse le shadow au container
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
          icon: Icon(Icons.person_outline),
          label: "Profil",
        ),
      ],
    ),
  ),
),

    );
  }
}



































































































/*

class HomePage extends StatelessWidget {
  final Etudiant etudiant;

  const HomePage({required this.etudiant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenue ${etudiant.prenom}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom : ${etudiant.nom}", style: TextStyle(fontSize: 18)),
            Text("Prénom : ${etudiant.prenom}", style: TextStyle(fontSize: 18)),
            Text("Apogée : ${etudiant.apogee}", style: TextStyle(fontSize: 18)),
            Text("CIN : ${etudiant.cin}", style: TextStyle(fontSize: 18)),
            Text("Cycle : ${etudiant.cycle}", style: TextStyle(fontSize: 18)),
            Text("Email : ${etudiant.email}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    ); */
  
