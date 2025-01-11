import "package:chatsy/components/auth/login_or_register.dart";
import "package:chatsy/pages/home_page.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
class IsAuthorized extends StatelessWidget {
  const IsAuthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          return HomePage();
        } else {
          return LoginOrRegister();
        }
      },
    );
  }
}
