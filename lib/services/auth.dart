import 'package:firebase_auth/firebase_auth.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/database.dart';

class Auth {
  FirebaseAuth _auth;

  Auth() {
    _auth = FirebaseAuth.instance;
  }

  Future<bool> register(UserModel userModel, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      if (result.user == null) return false;
      userModel.id = result.user.uid;
      if (!await Database().insertUser(userModel)) {
        result.user.delete();
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> signIn(String email, String password) async {
    try {
      AuthResult results = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (results.user == null) return null;
      return await Database().getUser(results.user.uid);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }
}
