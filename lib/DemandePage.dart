import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'package:amplify_api/amplify_api.dart';


class DemandePage extends StatefulWidget {
  final Etudiant etudiant;

  const DemandePage({super.key, required this.etudiant});

  @override
  State<DemandePage> createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  
  List<Absence> demandes = [];
  bool isLoading = true;

  // Définition des couleurs pour le thème moderne Bleu/Blanc
  static const Color primaryBlue = Color(0xFF2563EB); // Bleu royal
  static const Color lightBlueBg = Color(0xFFF0F4F8); // Fond clair bleuté
  static const Color textDark = Color(0xFF1E293B); // Texte sombre

  @override
  void initState() {
    super.initState();
    _fetchDemandes();
  }

  Future<void> _fetchDemandes() async {
    setState(() => isLoading = true);
    try {
      final req = ModelQueries.list(
        Absence.classType,
        where: Absence.ETUDIANT.eq(widget.etudiant.id),
      );
      final res = await Amplify.API.query(request: req).response;

      if (res.data != null) {
        setState(() {
          demandes = res.data!.items.whereType<Absence>().toList();
        });
      }
    } catch (e) {
      safePrint("Erreur: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _deleteDemande(Absence demande) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Supprimer l'absence ?"),
        content: const Text("Êtes-vous sûr de vouloir supprimer l'absence ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Supprimer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await Amplify.API.mutate(request: ModelMutations.delete(demande)).response;
        setState(() => demandes.remove(demande));
      } catch (_) {}
    }
  }

  Widget _statusChip(Status status) {
    Color color;
    String label;

    switch (status) {
      case Status.ACCEPTE:
        color = Colors.green;
        label = "Acceptée";
        break;
      case Status.REFUS:
        color = Colors.red;
        label = "Refusée";
        break;
      case Status.ENCOURS:
      default:
        color = Colors.orange;
        label = "En cours";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueBg,
      appBar: AppBar(
        title: const Text("Mes Absences"),
        centerTitle: true,
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: primaryBlue))
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _header(),
                          const SizedBox(height: 24),
                          _buildDemandesList(),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _header() {
    int nbAccepte = demandes.where((d) => d.status == Status.ACCEPTE).length;
    int nbRefus = demandes.where((d) => d.status == Status.REFUS).length;
    int nbEnCours = demandes.where((d) => d.status == Status.ENCOURS).length;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: lightBlueBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: primaryBlue.withOpacity(0.1),
            child: Icon(Icons.school, size: 40, color: primaryBlue),
          ),
          const SizedBox(height: 12),
          Text(
            "Total Absence : ${demandes.length}",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: textDark),
          ),
          const SizedBox(height: 6),
          Text(
            "Acceptées : $nbAccepte  •  En cours : $nbEnCours  •  Refusées : $nbRefus",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildDemandesList() {
    if (demandes.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Aucune justification d'absence pour le moment.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demandes.length,
      itemBuilder: (context, index) {
        final demande = demandes[index];

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statusChip(demande.status),
                    Text(
                  demande.createdAt != null ? demande.createdAt!.toString().split(' ')[0] : '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (demande.commentaire != null && demande.commentaire!.isNotEmpty)
                  Text(
                    "Commentaire : ${demande.commentaire}",
                    style: const TextStyle(fontSize: 14),
                  ),
                if (demande.module != null && demande.module!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "Module : ${demande.module}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text("Supprimer",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => _deleteDemande(demande),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  
}