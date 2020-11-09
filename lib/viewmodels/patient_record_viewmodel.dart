import 'package:flutter/material.dart';
import 'package:se_project02/models/medicine.dart';
import 'package:se_project02/services/database.dart';

class PatientRecordViewModel extends ChangeNotifier {
  List<Medicine> medicines;

  PatientRecordViewModel(String uid) {
    getMedicines(uid);
  }

  getMedicines(String uid) async {
    Database database = new Database();
    medicines = await database.getRecordsByUser(uid);
    print(medicines);
    notifyListeners();
  }
}
