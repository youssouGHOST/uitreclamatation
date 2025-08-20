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
      } else {
        safePrint("Erreur GraphQL: ${res.errors}");
      }
    } catch (e) {
      safePrint("Erreur fetch demandes: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _logout() async {
    try {
      await Amplify.Auth.signOut();
      if (!mounted) return;
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      safePrint("Erreur déconnexion: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la déconnexion")),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    

    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mes Demandes"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 141, 255),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            Expanded(child: _buildDemandesList()),
            const SizedBox(height: 16),
            _buildLogoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _buildProfileHeader() {
    
int nbAccepte = demandes.where((d) => d.status == Status.ACCEPTE).length;
final nbRefus = demandes.where((d) => d.status == Status.REFUS).length;
final nbEnCours = demandes.where((d) => d.status == Status.ENCOURS).length;
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue.shade300,
          child: const Icon(Icons.numbers, size: 20, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text("Nombre de demandes :  ${demandes.length}",
        ),
        Text("ACCEPTE : $nbAccepte "),
        
        Text("EN COURS  : $nbEnCours",
        ),
        Text("REFUSE : $nbRefus ",
        ),
      
      ],
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            leading: _iconForType(demande.typeDemande),
            title: Text(
              _titleForType(demande.typeDemande),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (demande.commentaire != null && demande.commentaire!.isNotEmpty)
                  Text(demande.commentaire!),
                const SizedBox(height: 4),
                Text(
                  "Statut: ${demande.status.name}",
                  style: TextStyle(
                    color: demande.status == Status.ACCEPTE
                        ? Colors.green
                        : demande.status == Status.REFUS
                            ? Colors.red
                            : Colors.orange,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: _logout,
      icon: const Icon(Icons.logout, color: Colors.white),
      label: const Text(
        "Déconnexion",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _iconForType(TypeDemande? type) {
    switch (type) {
      case TypeDemande.ABSENCE:
        return const Icon(Icons.event_busy, color: Colors.deepPurple);
      case TypeDemande.CHANGEMENTFILIERE:
        return const Icon(Icons.swap_horiz, color: Colors.indigo);
      case TypeDemande.AJOUTMODULE:
        return const Icon(Icons.add_box, color: Colors.blue);
      default:
        return const Icon(Icons.help_outline, color: Colors.grey);
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
