import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wisehealthylife/provider/loading.dart';

String roomkey = "";

class RoomKey extends StatefulWidget {
  @override
  _KeyScreenState createState() => _KeyScreenState();
}

class _KeyScreenState extends State {
  String RoomKey = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder(
            future: FirebaseFirestore.instance.collection('PrivateRoom').get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Scaffold(
                  body: Center(
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<
                      String,
                      dynamic>;
                  String PrivateRoomKeyList = data["roomKey"];
                  for (;;) {
                    RoomKey = setkey();
                    if (PrivateRoomKeyList != RoomKey) {
                      break;
                    }
                  }
                  roomkey = RoomKey;
                }),
              );
            },


          );
        }
      );
  }

}

class setCode {
  setCode() {
    //runApp(RoomKey());
  }
  String roomkey1 = setkey();

}

String setkey(){  //방키 랜덤 생성 함수
  List<String> code = ["","","","","",""];
  String roomKey = "";
  for(int i = 0; i < 6; i++) {
    var roomcode = Random().nextInt(10);
    var setCode = roomcode.toString();
    code[i] = setCode;
  }

  for(int i = 0; i <= code.length-1; i++) {
    roomKey = roomKey + code[i];
  }

  setState(() {});
  return roomKey;
}


void setState(Null Function() param0) {
}