import 'package:chatsy/components/my_button.dart';
import 'package:chatsy/components/my_text_field.dart';
import 'package:chatsy/services/auth_services.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _rePassController.dispose();
  }

  final Auth _auth = Auth();

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    void register() {
      if (_passController.text == _rePassController.text) {
        setState(() {
          isLoading = true;
        });
       try {
         _auth.createUser(_emailController.text, _passController.text).then((value){
           setState(() {
             isLoading = false;
           });
           if(context.mounted) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Center(
                     child: Text(
                         "check your credentials"))));
           }
         });
       } catch (e) {
         showDialog(
             context: context,
             builder: (context) {
               return AlertDialog(
                 title: Text("Warning!!"),
                 content: Text("Check your internet connection"),
                 actions: [
                   TextButton(
                       onPressed: () {
                         Navigator.of(context).pop();
                       },
                       child: Text("Close"))
                 ],
               );
             });
       }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Warning!!"),
                content: Text("Passwords didn't match"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      }
    }
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
            if (isLoading) CircularProgressIndicator(),
            if (isLoading)
              SizedBox(
                height: 20,
              ),
            MyButton(buttonText: "Register", onTapFunc: register),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already Have an Account?"),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: widget.toggle,
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
