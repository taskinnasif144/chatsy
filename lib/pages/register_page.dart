import 'package:chatsy/components/my_button.dart';
import 'package:chatsy/components/my_text_field.dart';
import 'package:chatsy/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.toggle});
  final VoidCallback toggle;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();


  final Auth _auth = Auth();

  void register () {

    if (_passController.text == _rePassController.text) {

      _auth.createUser(_emailController.text, _passController.text);
    } else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Warning!!"),
          content: Text("Passwords didn't match"),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text("Close"))
          ],
        );
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

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
              "Welcome to Chatsy",
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
              hintText: "Password",
              isPass: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              textController: _rePassController,
              hintText: "Re-Type Password",
              isPass: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(buttonText: "Register", onTapFunc: register),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already Have an Account?"),
                SizedBox(width: 5,),
                GestureDetector(onTap: widget.toggle ,child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
