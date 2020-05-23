import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mathy_extended/models/firebase/user.dart';
import 'package:mathy_extended/services/firebase/database/database_provider.dart';

class AuthProvider {
  final _auth = FirebaseAuth.instance;

  // sign in with email and password
  Future signInWithEmailAndPassword(
      {@required final String email, @required final String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.message);
    }
  }

  // sign up with email and password
  Future signUpWithEmailAndPassword(
      {@required final String name,
      @required final String email,
      @required final String password}) async {
    try {
      final _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final FirebaseUser _user = _result.user;

      _userFromFirebase(_user);
      DatabaseProvider(uid: _user.uid)
          .sendUserDetails(name: name, email: email);
    } catch (e) {
      print(e.message);
    }
  }

  // sign out user
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.message);
    }
  }

  // user from firebase
  User _userFromFirebase(FirebaseUser _user) {
    return _user != null ? User(uid: _user.uid) : null;
  }

  // stream of user
  Stream<User> get userDetail {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }
}
