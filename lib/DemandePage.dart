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
  List<Demande> demandes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDemandes();
  }

  Future<void> _fetchDemandes() async {
    setState(() => isLoading = true);
    try {
      final req = ModelQueries.list(
        Demande.classType,
        where: Demande.ETUDIANT.eq(widget.etudiant.id),
      );
      final res = await Amplify.API.query(request: req).response;

      if (res.data != null) {
        setState(() {
          demandes = res.data!.items.whereType<Demande>().toList();
        });
      }
    } catch (e) {
      safePrint("Erreur: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _deleteDemande(Demande demande) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Supprimer la demande ?"),
        content: const Text("Êtes-vous sûr de vouloir supprimer cette demande ?"),
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mes Demandes"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2F8DFF),
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 20),
            Expanded(child: _buildDemandesList()),
            const SizedBox(height: 20),
            _logoutButton(),
          ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: const AssetImage('assets/vdemande.png'),
          ),
          const SizedBox(height: 12),
          Text(
            "Total demandes : ${demandes.length}",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (demandes.isEmpty) {
      return const Center(
        child: Text(
          "Aucune demande pour le moment.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      itemCount: demandes.length,
      itemBuilder: (context, index) {
        final demande = demandes[index];

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _iconForType(demande.typeDemande),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _titleForType(demande.typeDemande),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    _statusChip(demande.status),
                  ],
                ),
                const SizedBox(height: 12),
                if (demande.commentaire != null &&
                    demande.commentaire!.isNotEmpty)
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

  Widget _logoutButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () async {
        await Amplify.Auth.signOut();
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      icon: const Icon(Icons.logout, color: Colors.white),
      label: const Text("Déconnexion",
          style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  Widget _iconForType(TypeDemande? type) {
    switch (type) {
      case TypeDemande.ABSENCE:
        return Image.asset('assets/absence.png', width: 30);
      case TypeDemande.CHANGEMENTFILIERE:
        return const Icon(Icons.swap_horiz, color: Colors.indigo, size: 30);
      case TypeDemande.AJOUTMODULE:
        return const Icon(Icons.add_box, color: Colors.blue, size: 30);
      default:
        return const Icon(Icons.help_outline, color: Colors.grey, size: 30);
    }
  }

  String _titleForType(TypeDemande? type) {
    switch (type) {
      case TypeDemande.ABSENCE:
        return "Justification d'absence";
      case TypeDemande.CHANGEMENTFILIERE:
        return "Changement de filière";
      case TypeDemande.AJOUTMODULE:
        return "Ajout de module";
      default:
        return "Demande inconnue";
    }
  }
}
