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
    var username = user?.displayName.toString(); // 유저 이름
    var photoURL = user?.photoURL; // 유저 프로필 사진
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
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
                        '$username',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
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
      },
    );
  }
}
