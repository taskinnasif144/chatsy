import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText, required this.onTapFunc});
  final String buttonText;
  final VoidCallback onTapFunc;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity ,
      child: ElevatedButton(
        onPressed: onTapFunc,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
