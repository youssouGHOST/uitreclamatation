import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/widget/CustomBottomNav.dart';
import 'package:amplify_api/amplify_api.dart';

class PageAttestation extends StatefulWidget {
  final Etudiant etudiant;

  const PageAttestation({super.key, required this.etudiant});

  @override
  State<PageAttestation> createState() => _PageAttestationState();
}

class _PageAttestationState extends State<PageAttestation> {
  List<AttestationInscription> demandes = [];
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
        AttestationInscription.classType,
        where: AttestationInscription.ETUDIANT.eq(widget.etudiant.id),
      );
      final res = await Amplify.API.query(request: req).response;

      if (res.data != null) {
        setState(() {
          demandes =
              res.data!.items.whereType<AttestationInscription>().toList();
        });
      }
    } catch (e) {
      safePrint("Erreur: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _deleteDemande(AttestationInscription demande) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Supprimer l'attestation ?"),
        content:
            const Text("Êtes-vous sûr de vouloir supprimer cette demande ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child:
                const Text("Supprimer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await Amplify.API
            .mutate(request: ModelMutations.delete(demande))
            .response;
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
        label = "Disponible à la scolarité";
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
        title: const Text("Attestation d'inscription"),
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
            "Validées : $nbAccepte  •  En cours : $nbEnCours  •  Refusées : $nbRefus",
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
          "Aucune demande d'attestation pour le moment.",
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
                    const Icon(Icons.school, color: Colors.blue, size: 30),
                    const SizedBox(width: 12),
                    _statusChip(demande.status),
                  ],
                ),

                const SizedBox(height: 12),

                // 🔵 BOUTON "GÉNÉRER L'ATTESTATION"
                if (demande.status == Status.ACCEPTE)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.picture_as_pdf,
                          color: Colors.white),
                      label: const Text("Générer attestation",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // 👉 ici tu appelles ton service PDF
                      },
                    ),
                  ),

                const SizedBox(height: 10),

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
}
