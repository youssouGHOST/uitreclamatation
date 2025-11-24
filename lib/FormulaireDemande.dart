import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';
import 'service/StorageService.dart';

class FormulaireDemande extends StatefulWidget {
  final TypeDemande typeDemande;

  const FormulaireDemande({super.key, required this.typeDemande});

  @override
  State<FormulaireDemande> createState() => _FormulaireDemandeState();
}

class _FormulaireDemandeState extends State<FormulaireDemande> {
  final TextEditingController _commentaireController = TextEditingController();
  final TextEditingController _moduleController = TextEditingController();

  bool _loading = false;
  String? _fileName;
  String? _justificationUrl;

  late TypeDemande typeDemande;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    typeDemande = (args is TypeDemande) ? args : TypeDemande.ABSENCE;
  }

  Future<void> _choisirJustificatif() async {
    final url = await StorageService.uploadJustification();
    if (url != null) {
      setState(() {
        _justificationUrl = url;
        _fileName = url.split("/").last;
      });
    }
  }

  Future<void> _envoyerDemande() async {
    setState(() => _loading = true);

    try {
      final etudiant = Provider.of<EtudiantProvider>(context, listen: false).etudiant;
      if (etudiant == null) throw Exception("Aucun étudiant connecté");

      final demande = Demande(
        typeDemande: typeDemande,
        status: Status.ENCOURS,
        commentaire: _commentaireController.text.trim(),
        module: _moduleController.text.trim(),
        justificationUrl: _justificationUrl,
        etudiant: etudiant,
      );

      final request = ModelMutations.create(demande);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✔ Demande envoyée")),
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
    final typeText = typeDemande.name.replaceAll("_", " ").toLowerCase();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Nouvelle Demande"),
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
              _header(typeText),
              const SizedBox(height: 20),
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

  // -------------------------------
  // HEADER MODERNE
  // -------------------------------
  Widget _header(String typeText) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.assignment, size: 40, color: Color(0xFF2F8DFF)),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "Type : ${typeText[0].toUpperCase()}${typeText.substring(1)}",
              style: const TextStyle(
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
  // FORMULAIRE STYLÉ
  // -------------------------------
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
              labelText: "Motif",
              labelStyle: TextStyle(color: Colors.grey[700]),
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

  // -------------------------------
  // JUSTIFICATIF SECTION
  // -------------------------------
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
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

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
