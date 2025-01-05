import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future createUser(email, pass) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);


      FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({
        "uid": credential.user!.uid,
        "email": email
      });

      return credential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  Future userLogin(email, pass) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({
        "uid": credential.user!.uid,
        "email": email
      });
      return credential;
    } on FirebaseAuthException catch(e) {
      throw(e.code);
    }
  }
}
