import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';

class EtudiantProvider with ChangeNotifier {
  Etudiant? _etudiant;

  Etudiant? get etudiant => _etudiant;

  void setEtudiant(Etudiant e) {
    _etudiant = e;
    notifyListeners();
  }

  void clearEtudiant() {
    _etudiant = null;
    notifyListeners();
  }
}
