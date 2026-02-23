import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';
import 'service/StorageService.dart';

class FormulaireAbsence extends StatefulWidget {
  const FormulaireAbsence({super.key});

  @override
  State<FormulaireAbsence> createState() => _FormulaireAbsenceState();
}

class _FormulaireAbsenceState extends State<FormulaireAbsence> {
  final TextEditingController _commentaireController = TextEditingController();
  final TextEditingController _moduleController = TextEditingController();

  bool _loading = false;
  String? _fileName;
  String? _justificationUrl;

  
Future<void> _choisirJustificatif() async {
  final etudiant = Provider.of<EtudiantProvider>(context, listen: false).etudiant;
  if (etudiant == null) return;

  try {
    // Appel à StorageService avec hachage automatique
    final result = await StorageService.uploadJustification(
      apogee: etudiant.apogee,
    );

    if (result != null) {
      setState(() {
        _justificationUrl = result;

        // Extraire juste le nom du fichier à partir de l’URL
        final segments = result.split('/');
        _fileName = segments.isNotEmpty ? segments.last.split('?').first : 'justificatif';
      });
      safePrint("📎 Fichier prêt : $_fileName");
    }
  } catch (e) {
    safePrint("❌ Erreur lors de la sélection du justificatif : $e");
  }
}




  Future<void> _envoyerAbsence() async {
    setState(() => _loading = true);

    try {
      final etudiant = Provider.of<EtudiantProvider>(context, listen: false).etudiant;
      if (etudiant == null) throw Exception("Aucun étudiant connecté");

      final absence = Absence(
        status: Status.ENCOURS,
        commentaire: _commentaireController.text.trim(),
        module: _moduleController.text.trim(),
        justificationUrl: _justificationUrl,
        dateAbsence: TemporalDateTime(DateTime.now()),
        etudiant: etudiant,
      );

      final request = ModelMutations.create(absence);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✔ Absence envoyée")),
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
        title: const Text("Déclaration d’absence"),
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
              _inputCard(),
              const SizedBox(height: 15),
              _justificatifCard(),
              const SizedBox(height: 25),
              _submitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _inputCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: _commentaireController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Motif d’absence",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _moduleController,
            decoration: InputDecoration(
              labelText: "Module",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _justificatifCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            onPressed: _choisirJustificatif,
            icon: const Icon(Icons.attach_file, color: Colors.white),
            label: const Text("Joindre un justificatif"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          if (_fileName != null) ...[
            const SizedBox(height: 10),
            Text(
              "📎 Fichier ajouté : $_fileName",
              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: _loading ? null : _envoyerAbsence,
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
              "Envoyer l’absence",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
    );
  }
}
