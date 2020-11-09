import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se_project02/models/event.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/models/medicine.dart';

class Database {
  Firestore _firestore;
  final String userPath = 'Users';
  final String patient = 'PatientData';
  final String appointment = 'Appointments';

  Database() {
    _firestore = Firestore.instance;
  }

  Future<bool> insertUser(
    UserModel user,
  ) async {
    try {
      await _firestore
          .collection(userPath)
          .document(user.id)
          .setData(user.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> insertMedi(
    Medicine medicine,
  ) async {
    try {
      await _firestore
          .collection(patient)
          .document(medicine.id)
          .setData(medicine.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(userPath).document(uid).get();
      return UserModel.fromMap(snapshot.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Medicine> getMedi(String id) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(patient).document(id).get();
      return Medicine.fromMap(snapshot.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Medicine>> getRecordsByUser(String uid) async {
    try {
      print("User: $uid");
      List<Medicine> medicines = List();
      QuerySnapshot snapshot = await _firestore
          .collection(patient)
          .where("patient_id", isEqualTo: uid)
          .getDocuments();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.documents) {
        Medicine model = Medicine.fromMap(r.data);
        medicines.add(model);
      }
      return medicines;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserModel>> getTime(String uid) async {
    try {
      print("User: $uid");
      List<UserModel> user = List();
      QuerySnapshot snapshot = await _firestore
          .collection(userPath)
          .where("id", isEqualTo: uid)
          .getDocuments();
      print("Snaps : $snapshot");
      for (DocumentSnapshot r in snapshot.documents) {
        UserModel model = UserModel.fromMap(r.data);
        user.add(model);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<List<EventModel>> getAppointments(String uid, String type) async {
    try {
      print("User: $uid");
      if (type == "doctor") {
        List<EventModel> event = List();
        QuerySnapshot snapshot = await _firestore
            .collection(appointment)
            .where("doc_id", isEqualTo: uid)
            .getDocuments();
        print("Snaps : $snapshot");
        for (DocumentSnapshot r in snapshot.documents) {
          EventModel model = EventModel.fromMap(r.data);
          event.add(model);
        }

        return event;
      } else {
        List<EventModel> event = List();
        QuerySnapshot snapshot = await _firestore
            .collection(appointment)
            .where("id", isEqualTo: uid)
            .getDocuments();
        print("Snaps : $snapshot");
        for (DocumentSnapshot r in snapshot.documents) {
          EventModel model = EventModel.fromMap(r.data);
          event.add(model);
        }

        return event;
      }
    } catch (e) {
      print(e);
    }
  }
}
