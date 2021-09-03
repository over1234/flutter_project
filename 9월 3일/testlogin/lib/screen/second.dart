import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'My_Friend',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent),
      ),
    );
  }
}