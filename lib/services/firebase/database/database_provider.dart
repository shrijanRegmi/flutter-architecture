import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mathy_extended/models/firebase/user.dart';
import 'package:provider/provider.dart';

class DatabaseProvider extends Provider {
  final uid;
  DatabaseProvider({this.uid});

  final _ref = Firestore.instance;

  final String _appName = "Mathy";

  // send user details
  Future sendUserDetails(
      {@required final String name, @required final String email}) async {
    try {
      await _ref
          .collection(_appName)
          .document("Users")
          .collection("Users")
          .document(uid)
          .setData({
        "uid": uid,
        "userName": name,
        "userEmail": email,
      });
    } catch (e) {}
  }

  // get user details
  User _userFromFirebase(DocumentSnapshot ds) {
    return User(
      uid: ds.data["uid"] ?? "",
      userName: ds.data["userName"] ?? "",
      userEmail: ds.data["userEmail"] ?? "",
    );
  }

  // stream of users
  Stream<User> get userDetail {
    return _ref
        .collection(_appName)
        .document("Users")
        .collection("Users")
        .document(uid)
        .snapshots()
        .map(_userFromFirebase);
  }
}
