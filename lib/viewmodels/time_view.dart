import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/database.dart';

class TimeViewModel extends ChangeNotifier {
  List<UserModel> time;

  TimeViewModel(String uid) {
    getAppointment(uid);
  }

  getAppointment(String uid) async {
    Database database = new Database();
    time = await database.getTime(uid);
    print(time);
    notifyListeners();
  }
}
