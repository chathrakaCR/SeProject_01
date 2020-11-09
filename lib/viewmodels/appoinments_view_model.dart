import 'package:flutter/material.dart';
import 'package:se_project02/models/event.dart';
import 'package:se_project02/services/database.dart';

class AppointmentsViewModel extends ChangeNotifier {
  final String type;

  List<EventModel> event;

  AppointmentsViewModel(String uid, this.type) {
    getAppointment(uid);
  }

  getAppointment(String uid) async {
    Database database = new Database();
    event = await database.getAppointments(uid, this.type);
    print(event);
    notifyListeners();
  }
}
