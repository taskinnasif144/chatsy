import 'package:chatsy/services/auth_services.dart';
import 'package:flutter/material.dart';

Container buildWelcomeText(BuildContext context, Auth _auth) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Text("Welcome ${_auth.authUser.email}", style: TextStyle(color: Colors.white),));
}

class HiveBoxes {
  static String userBox = "user-box";
}
