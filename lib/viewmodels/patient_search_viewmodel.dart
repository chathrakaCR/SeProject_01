import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';

class PatientSearchViewModel extends ChangeNotifier {
  List<UserModel> users;

  query(String query) {
    Firestore.instance
        .collection("Users")
        .where("userName", isGreaterThanOrEqualTo: query.toLowerCase())
        .where("userName", isLessThan: createSuccessorKey(query.toLowerCase()))
        .limit(5)
        .getDocuments()
        .then((value) {
      users = List();
      value.documents.forEach((doc) {
        UserModel user = UserModel();

        user = UserModel.fromMap(doc.data);
        users.add(user);
      });
      print(users);
      notifyListeners();
    });
  }

  String createSuccessorKey(String query) {
    String lastCharacter = query[query.length - 1];
    String temp = query.substring(0, query.length - 1);
    int c = lastCharacter.codeUnitAt(0);

    int end = "z".codeUnitAt(0);
    if (c < end) {
      c++;
    }
    temp += String.fromCharCode(c);
    print("Successor Key : $temp");
    return temp;
  }
}
