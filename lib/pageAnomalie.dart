import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'package:amplify_api/amplify_api.dart';

class PageAnomalie extends StatefulWidget {
  final Etudiant etudiant;

  const PageAnomalie({super.key, required this.etudiant});

  @override
  State<PageAnomalie> createState() => _PageAnomalieState();
}

class _PageAnomalieState extends State<PageAnomalie> {
  List<Anomalies> demandes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDemandes();
  }

  // 🔵 Charger les anomalies
  Future<void> _fetchDemandes() async {
    setState(() => isLoading = true);
    try {
      final req = ModelQueries.list(
        Anomalies.classType,
        where: Anomalies.ETUDIANT.eq(widget.etudiant.id),
      );

      final res = await Amplify.API.query(request: req).response;

      if (res.data != null) {
        demandes = res.data!.items.whereType<Anomalies>().toList();
      }

    } catch (e) {
      safePrint("Erreur: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur lors du chargement")),
      );
    }

    setState(() => isLoading = false);
  }

  // 🔴 Suppression
  Future<void> _deleteDemande(Anomalies demande) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Supprimer le signalement ?"),
        content: const Text("Voulez-vous vraiment supprimer cette anomalie ?"),
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
      } catch (e) {
        safePrint("Erreur suppression: $e");
      }
    }
  }

  // 🟠 Badge statut
  Widget _statusChip(Status status) {
    Color color;
    String label;

    switch (status) {
      case Status.ACCEPTE:
        color = Colors.green;
        label = "Traité";
        break;
      case Status.REFUS:
        color = Colors.red;
        label = "Non traité";
        break;
      case Status.ENCOURS:
      default:
        color = Colors.orange;
        label = "En cours de traitement";
    }
  
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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

 Widget _AnomalieChip(Anomalie anomalie) {
    String type;

    switch (anomalie) {
      case Anomalie.AFFICHAGE_ENT:
        type = "AFFICHAGE ENT";
        break;
      case Anomalie.CALENDRIER_EXAMEN:
        type = "Calendrier Examen";
        break;
      case Anomalie.INSCRIPTION:
      default:
        type = "Problème d'inscription";
    }
return 
  Text("Type d'anomalie : $type",
    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
     );

 }

  //  Header statistique
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
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/vdemande.png'),
          ),
          const SizedBox(height: 12),
          Text(
            "Total anomalies : ${demandes.length}",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            "Traitées : $nbAccepte  •  En cours : $nbEnCours  •  Non traitées : $nbRefus",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  //  Affichage de la liste
  Widget _buildDemandesList() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (demandes.isEmpty) {
      return const Center(
        child: Text(
          "Aucune anomalie signalée pour le moment.",
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
                    const SizedBox(width: 12),
                    _statusChip(demande.status),
                  ],
                ),

                const SizedBox(height: 12),
               _AnomalieChip(demande.anomalie),

              
                if (demande.description != null &&
                    demande.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      demande.description!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text("Supprimer", style: TextStyle(color: Colors.white)),
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

  // 🔵 Déconnexion
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

  // 🏗️ Build complet
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mes anomalies"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2F8DFF),
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
}
 