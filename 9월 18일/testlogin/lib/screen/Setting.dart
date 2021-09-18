import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/provider/auth.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Text('Setting',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: Text('SignOut',
                style: TextStyle(
                    fontSize: 40.0, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //모서리를 둥글게
                    borderRadius: BorderRadius.circular(20)),
                primary: const Color(0xffaee6ea),
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                firebaseLogOut();
                Navigator.pop(context);
              },
            ),
          ]
        ),
      ),
    );
  }
}