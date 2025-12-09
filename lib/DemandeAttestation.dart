import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';

class DemandeAttestation extends StatefulWidget {
  const DemandeAttestation({super.key});

  @override
  State<DemandeAttestation> createState() => _DemandeAttestationState();
}

class _DemandeAttestationState extends State<DemandeAttestation> {
  bool _loading = false;

  Future<void> _envoyerDemande() async {
    setState(() => _loading = true);

    try {
      final etudiant =
          Provider.of<EtudiantProvider>(context, listen: false).etudiant;

      if (etudiant == null) throw Exception("Aucun étudiant connecté");

      // -------------------------------
      // CRÉATION ATTÉSTATION
      // -------------------------------

      final attestation = AttestationInscription(
        etudiant: etudiant,
        status: Status.ENCOURS,  // 🔥 champ requis

      );

      final request = ModelMutations.create(attestation);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✔ Attestation demandée avec succès")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      safePrint("Erreur: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Erreur : $e")),
      );
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Demande d’attestation"),
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
              const SizedBox(height: 25),
              _submitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  // -------------------------------
  // HEADER
  // -------------------------------
  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.school, size: 40, color: Color(0xFF2F8DFF)),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              "Demande d’attestation d’inscription",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // MODULE
  // -------------------------------


  // -------------------------------
  // BOUTON D’ENVOI
  // -------------------------------
  Widget _submitButton() {
    return ElevatedButton(
      onPressed: _loading ? null : _envoyerDemande,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F8DFF),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: _loading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(
              "Envoyer la demande",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
    );
  }
}
