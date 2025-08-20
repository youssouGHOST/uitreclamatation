 
import 'package:amplify_flutter/amplify_flutter.dart';
import '../models/ModelProvider.dart';

Future<Etudiant?> fetchEtudiantAvecDemandes(String email) async {
  try {
    // Récupérer l'étudiant par email
    final etudiants = await Amplify.DataStore.query(
      Etudiant.classType,
      where: Etudiant.EMAIL.eq(email),
    );

    if (etudiants.isNotEmpty) {
      final etudiant = etudiants.first;

      // Récupérer ses demandes
      final demandes = await Amplify.DataStore.query(
        Demande.classType,
        where: Demande.ETUDIANT.eq(etudiant.id),
      );

      // Retourner une copie de l'étudiant avec ses demandes
      return etudiant.copyWith(demande: demandes);
    }
  } catch (e) {
    print("Erreur lors de la récupération : $e");
  }
  return null;
}


 