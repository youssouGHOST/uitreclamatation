import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'provider/EtudiantProvider.dart';
import 'widget/CustomBottomNav.dart';

class FormulaireAjoutModule extends StatefulWidget {
  const FormulaireAjoutModule({super.key});

  @override
  State<FormulaireAjoutModule> createState() => _FormulaireAjoutModuleState();
}

class _FormulaireAjoutModuleState extends State<FormulaireAjoutModule> {
  final TextEditingController _moduleController = TextEditingController();

  final List<String> _selectedSemestres = [];
  bool _loading = false;

  final List<String> semestres = [
    "Semestre 1",
    "Semestre 2",
    "Semestre 3",
    "Semestre 4",
  ];

  Future<void> _envoyerAjoutModule() async {
    if (_moduleController.text.trim().isEmpty ||
        _selectedSemestres.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    if (int.tryParse(_moduleController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Le module doit être un nombre")),
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

      final ajoutModule = AjoutModule(
        module: int.parse(_moduleController.text),
        semestre: _selectedSemestres.join(", "),
        status: Status.ENCOURS,
        etudiant: etudiant,
      );

      final request = ModelMutations.create(ajoutModule);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✔ Demande envoyée")),
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
        title: const Text("Demande d’ajout de module"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2F8DFF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _moduleCard(),
              const SizedBox(height: 20),
              _semestreCard(),
              const SizedBox(height: 25),
              _submitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _moduleCard() {
    return _card(
      child: TextField(
        controller: _moduleController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Nombre du module",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _semestreCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Semestres validés",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ...semestres.map((s) {
            return CheckboxListTile(
              title: Text(s),
              value: _selectedSemestres.contains(s),
              onChanged: (checked) {
                setState(() {
                  if (checked == true) {
                    _selectedSemestres.add(s);
                  } else {
                    _selectedSemestres.remove(s);
                  }
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: _loading ? null : _envoyerAjoutModule,
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

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 1),
        ],
      ),
      child: child,
    );
  }
}
