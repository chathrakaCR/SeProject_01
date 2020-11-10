import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/database.dart';

class DocListViewModel extends ChangeNotifier {
  List<UserModel> users;

  DocListViewModel() {
    getdoc();
  }

  getdoc() async {
    Database database = new Database();
    users = await database.getD();
    print(users);
    notifyListeners();
  }
}