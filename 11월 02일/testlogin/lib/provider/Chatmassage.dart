import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chatmessage extends StatelessWidget {
  final String txt;
  final Animation<double> animation;
  Chatmessage(
    this.txt, {
    required this.animation,
    Key? key,
  }) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var username = user?.displayName;
    var photoURL = user?.photoURL;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: SizeTransition(
        sizeFactor: animation,
        axisAlignment: -1.0,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('$photoURL'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$username",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    txt,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
