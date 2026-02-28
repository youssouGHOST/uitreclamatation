import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:amplify_api/amplify_api.dart';

import 'package:reclamation_uit/models/ModelProvider.dart';

import 'package:reclamation_uit/DemandePage.dart';

import 'package:reclamation_uit/pageAnomalie.dart';

import 'package:reclamation_uit/pageAttestation.dart';

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

// Définition des couleurs pour le thème moderne Bleu/Blanc

static const Color primaryBlue = Color(0xFF2563EB); // Bleu royal

static const Color lightBlueBg = Color(0xFFF0F4F8); // Fond clair bleuté

static const Color textDark = Color(0xFF1E293B); // Texte sombre

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

return Card(
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textDark)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    ),
  ),
);
}

@override

Widget build(BuildContext context) {

return Scaffold(
  backgroundColor: lightBlueBg,
  appBar: AppBar(
    title: const Text("Tableau de bord"),
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
                      const Text(
                        "Statistiques",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                      ),
                      const SizedBox(height: 24),
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
                      const SizedBox(height: 16),
                      // CARD ATTESTATIONS
                      _buildCard(
                        title: "Attestations d'inscription",
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
                        },
                      ),
                        const SizedBox(height: 16),
                      // CARD ATTESTATIONS
                      _buildCard(
                        title: "Ajout de module",
                        subtitle: attestationDisponible
                            ? "Disponible • Total : $totalAttestations"
                            : "Aucune attestation",
                        icon: Icons.content_paste_go,
                        color: const Color.fromARGB(255, 2, 21, 196),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PageAttestation(
                                etudiant: widget.etudiant,
                              ),
                            ),
                          );
                        },
                      ),
                        const SizedBox(height: 16),
                      // CARD ATTESTATIONS
                      _buildCard(
                        title: "Annulation d'inscription",
                        subtitle: attestationDisponible
                            ? "Disponible • Total : $totalAttestations"
                            : "Aucune attestation",
                        icon: Icons.content_paste_off,
                        color: const Color.fromARGB(255, 255, 77, 0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PageAttestation(
                                etudiant: widget.etudiant,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      // CARD ANOMALIES
                      _buildCard(
                        title: "Anomalies",
                        subtitle: "Gérer les anomalies signalées",
                        icon: Icons.report_problem_outlined,
                        color: const Color.fromARGB(255, 234, 163, 58),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PageAnomalie(
                                etudiant: widget.etudiant,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
);
}

}