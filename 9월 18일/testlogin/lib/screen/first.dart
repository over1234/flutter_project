import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'main_screen',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent, fontFamily: 'Ubuntu',),
      ),
    );
  }
}