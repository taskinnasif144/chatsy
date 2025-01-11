import 'package:chatsy/models/hive_models/user_hive_model.dart';
import 'package:chatsy/models/user.dart';
import 'package:chatsy/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class Auth {
  AuthUser get authUser {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    return AuthUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }



  Future createUser(email, pass) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);

      FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({"uid": credential.user!.uid, "email": email});
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> userLogin(email, pass) async {

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({"uid": credential.user!.uid, "email": email});
      return true;
    } on FirebaseAuthException catch (e) {
      return false;

    }
  }

  Future logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  Future getAllUsers() async {

    final userBox = await Hive.openBox(HiveBoxes.userBox);
    try {
      final allUsers = await FirebaseFirestore.instance.collection("users").get();
      final currentUser = Auth().authUser.email;
      await userBox.clear();
      final allUserDocs = allUsers.docs
          .map((doc) {
            final data = doc.data();
            if (data['email'] != currentUser){
              final userHive = UserHiveModel(email: data['email'], uid: data['uid']);
              userBox.add(userHive);
            }
            return data;
      })
          .where((data) => data["email"] != currentUser)
          .toList();
      return allUserDocs;
    } catch (e) {
      return userBox.values.toList();
    }

  }
}
