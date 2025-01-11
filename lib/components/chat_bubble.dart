import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.isMyText
  });

  final String message;
  final bool isMyText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !isMyText? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: !isMyText? EdgeInsets.only(left: 30): EdgeInsets.only(right: 30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: !isMyText? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
