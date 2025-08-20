import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'provider/EtudiantProvider.dart';

class FormulaireDemande extends StatefulWidget {
    final TypeDemande typeDemande;

    const FormulaireDemande({super.key , required this.typeDemande});

  @override
  State<FormulaireDemande> createState() => _FormulaireDemandeState();
}

class _FormulaireDemandeState extends State<FormulaireDemande> {
  final TextEditingController _commentaireController = TextEditingController();
  bool _loading = false;

  late TypeDemande typeDemande; // Le type reçu depuis la page précédente

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Récupération du type passé en argument via Navigator
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && args is TypeDemande) {
      typeDemande = args;
    } else {
      // Valeur par défaut si rien n'est passé
      typeDemande = TypeDemande.ABSENCE;
    }
  }

  /// Fonction pour envoyer la demande à DynamoDB
  Future<void> _envoyerDemande() async {
    setState(() => _loading = true);

    try {
      // Récupération de l'étudiant connecté via Provider
      final etudiant = Provider.of<EtudiantProvider>(context, listen: false).etudiant;

      if (etudiant == null) {
        throw Exception("Aucun étudiant connecté");
      }

      // Création de l'objet Demande
      final demande = Demande(
        typeDemande: typeDemande,
        status: Status.ENCOURS, // statut par défaut
        commentaire: _commentaireController.text.trim(),
        etudiant: etudiant,
      );

      // Envoi à DynamoDB via Amplify
      final request = ModelMutations.create(demande);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Demande créée avec succès")),
        );
        Navigator.pop(context); // retour à la page précédente
      } else {
        throw Exception("Erreur lors de la création : ${response.errors}");
      }
    } catch (e) {
      safePrint("Erreur création demande : $e");
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
      appBar: AppBar(
        title: const Text("Nouvelle demande"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Affichage du type sélectionné
            Text(
              "Type de demande : ${typeText[0].toUpperCase()}${typeText.substring(1)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Champ pour le commentaire
            TextField(
              controller: _commentaireController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Commentaire / Motif",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Bouton d'envoi
            ElevatedButton(
              onPressed: _loading ? null : _envoyerDemande,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.blue,
              ),
              child: _loading
                  ? const CircularProgressIndicator(color: Color.fromARGB(255, 255, 255, 255))
                  : const Text("Envoyer la demande", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
