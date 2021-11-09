import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisehealthylife/provider/auth.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Center(
            child: Column(children: [
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                child: Text(
                  'SignOut',
                  style: TextStyle(
                      fontSize: 40.0, color: Colors.black, fontFamily: 'jua'),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: const Color(0xffaee6ea),
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  _showDialog();
                },
              ),
            ]),
          ),
        );
      },
    );
  }

  void _showDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'LogOut',
      desc: '정말로 로그아웃 하실건가요??',
      btnOkOnPress: () {
        firebaseLogOut();
      },
    )..show();
  }
}
