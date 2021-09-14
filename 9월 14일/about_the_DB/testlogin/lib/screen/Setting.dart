import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Setting',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent),
      ),
    );
  }
}