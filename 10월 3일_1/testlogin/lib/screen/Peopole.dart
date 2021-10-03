import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Text(
            'Add_Something',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent, fontFamily: 'Ubuntu',),
          ),
        );
      },
    );
  }
}