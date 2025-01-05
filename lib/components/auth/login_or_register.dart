import 'package:chatsy/pages/login_page.dart';
import 'package:chatsy/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLogin = true;
  void toggle () {
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
   if (isLogin) {
     return LoginPage(toggle: toggle,);
   } else {
     return RegisterPage(toggle: toggle,);
   }
  }
}
