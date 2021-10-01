import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';


class Chatmessage extends StatelessWidget {
  final String txt;
  final Animation<double> animation;


  const Chatmessage (this.txt,{required this.animation,Key? key, }) : super(key : key);

  @override

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0,
          ),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                  child: Text("!!"),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID or Email",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      Text(txt,
                        style: TextStyle(
                            fontSize: 16.0
                        ),
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