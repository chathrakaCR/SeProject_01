import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/database.dart';

class PharmacySearchViewModel extends ChangeNotifier {
  List<UserModel> users;

  PharmacySearchViewModel() {
    getPharm();
  }

  getPharm() async {
    Database database = new Database();
    users = await database.getP();
    print(users);
    notifyListeners();
  }
}
