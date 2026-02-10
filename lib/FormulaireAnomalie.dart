import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'provider/EtudiantProvider.dart';
import 'widget/CustomBottomNav.dart';

class FormulaireAnomalie extends StatefulWidget {
  const FormulaireAnomalie({super.key});

  @override
  State<FormulaireAnomalie> createState() => _FormulaireAnomalieState();
}

class _FormulaireAnomalieState extends State<FormulaireAnomalie> {
  String? _selectedAnomalie;
  final TextEditingController _descriptionController = TextEditingController();

  bool _loading = false;

  final Map<Anomalie, String> anomaliesLabels = {
    Anomalie.INSCRIPTION: "Problème d’inscription",
    Anomalie.AFFICHAGE_ENT: "Affichage  ENT",
    Anomalie.CALENDRIER_EXAMEN: "Calendrier des examens",
  };

  Future<void> _envoyerAnomalie() async {
    if (_selectedAnomalie == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez choisir une anomalie")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final etudiant =
          Provider.of<EtudiantProvider>(context, listen: false).etudiant;

      if (etudiant == null) {
        throw Exception("Aucun étudiant connecté");
      }

      final anomalie = Anomalies(
        anomalie: Anomalie.values
            .firstWhere((a) => a.name == _selectedAnomalie),
        description: _descriptionController.text.trim(),
        status: Status.ENCOURS,  

        etudiant: etudiant,
      );

      final request = ModelMutations.create(anomalie);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✔ Anomalie envoyée")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      safePrint("Erreur : $e");
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
        title: const Text("Déclarer une anomalie"),
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
              _anomalieCard(),
              const SizedBox(height: 20),
              _descriptionCard(),
              const SizedBox(height: 25),
              _submitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _anomalieCard() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Type d’anomalie",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ...Anomalie.values.map((a) {
            return CheckboxListTile(
              title: Text(anomaliesLabels[a]!),
              value: _selectedAnomalie == a.name,
              onChanged: (_) {
                setState(() => _selectedAnomalie = a.name);
              },
            );
          }).toList()
        ],
      ),
    );
  }

  Widget _descriptionCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 1),
        ],
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 4,
        decoration: InputDecoration(
          labelText: "Description de l’anomalie (optionnel)",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: _loading ? null : _envoyerAnomalie,
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
              "Envoyer l’anomalie",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
    );
  }
}
