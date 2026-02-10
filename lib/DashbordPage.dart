import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:reclamation_uit/models/ModelProvider.dart';
import 'package:reclamation_uit/DemandePage.dart';
import 'package:reclamation_uit/pageAnomalie.dart';
import 'package:reclamation_uit/pageAttestation.dart'; // Page Absence

class DashboardPage extends StatefulWidget {
  final Etudiant etudiant;

  const DashboardPage({super.key, required this.etudiant});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int totalAbsences = 0;
  int totalAttestations = 0;
  bool attestationDisponible = false;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => isLoading = true);

      // ======= LOAD ABSENCES =======
      final reqAbs = ModelQueries.list(
        Absence.classType,
        where: Absence.ETUDIANT.eq(widget.etudiant.id),
      );
      final resAbs = await Amplify.API.query(request: reqAbs).response;

      totalAbsences =
          resAbs.data?.items.whereType<Absence>().length ?? 0;

      // ======= LOAD ATTESTATIONS =======
      final reqAtt = ModelQueries.list(
        AttestationInscription.classType,
        where: AttestationInscription.ETUDIANT.eq(widget.etudiant.id),
      );
      final resAtt = await Amplify.API.query(request: reqAtt).response;

      final listAtt =
          resAtt.data?.items.whereType<AttestationInscription>().toList() ?? [];

      totalAttestations = listAtt.length;
      attestationDisponible = listAtt.isNotEmpty;

    } catch (e) {
      safePrint("Erreur Dashboard: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,                                                                                                                                                                  
              backgroundColor: color.withOpacity(.15),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black54)),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tableau de bord"),
        backgroundColor: const Color(0xFF2F8DFF),
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // CARD ABSENCE
                  _buildCard(
                    title: "Absences",
                    subtitle: "Total : $totalAbsences",
                    icon: Icons.note_alt_outlined,
                    color: const Color.fromARGB(255, 14, 49, 190),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DemandePage(
                            etudiant: widget.etudiant,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // CARD ATTESTATIONS
                  _buildCard(
                    title: "Attestations",
                    subtitle: attestationDisponible
                        ? "Disponible • Total : $totalAttestations"
                        : "Aucune attestation",
                    icon: Icons.picture_as_pdf_outlined,
                    color: Colors.green,
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PageAttestation(
                            etudiant: widget.etudiant,
                          ),
                        ),
                      );
                      // Tu peux ajouter une redirection plus tard
                    },
                  ),
                     const SizedBox(height: 20),

                       _buildCard(
                    title: "Anomalies",
                    subtitle: attestationDisponible
                        ? "Traitées • Total : $totalAttestations"
                        : "Aucune anomalie",
                    icon: Icons.report_problem_outlined ,
                    color: const Color.fromARGB(255, 234, 163, 58),
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PageAnomalie(etudiant: widget.etudiant,
                          ),
                        ),
                      );
                      // Tu peux ajouter une redirection plus tard
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
