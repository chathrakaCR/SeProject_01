import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se_project02/models/userModel.dart';

class Database {
  Firestore _firestore;
  final String userPath = 'Users';

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
}
