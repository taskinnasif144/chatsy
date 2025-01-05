import 'package:chatsy/components/my_button.dart';
import 'package:chatsy/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.toggle});
  final VoidCallback toggle;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  void login() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.message,
              size: 62,
            )),
            SizedBox(
              height: 12,
            ),
            Text(
              "Welcome Back to Chatsy",
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              textController: _emailController,
              hintText: "Email",
              isPass: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              textController: _passController,
              hintText: "password",
              isPass: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(buttonText: "Login", onTapFunc: login),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(width: 5,),
                GestureDetector(onTap: widget.toggle ,child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
