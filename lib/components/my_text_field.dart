import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key, required this.textController, required this.hintText, required this.isPass});
  final TextEditingController textController;
  final String hintText;
  final bool isPass;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPass,
      controller: textController,
      decoration:
      InputDecoration(border: OutlineInputBorder(), hintText: hintText),
    );
  }
}