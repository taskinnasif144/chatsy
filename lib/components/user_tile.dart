import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.userEmail,
    required this.onTap
  });
  final String userEmail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary
        ),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white,),
            SizedBox(
              width: 8,
            ),
            Text(userEmail,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
