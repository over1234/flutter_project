import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testlogin/provider/loading.dart';

import 'game_main_screen.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Roomname').snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Scaffold(
              body: Center(
                child: Text("아무 데이터도 없음",
                style: TextStyle(fontSize: 60),
                ),
              ),
            );
          }

          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Loading();
            }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                    border: Border.all(color: const Color(0xff55CED6), width: 1)),
                child: ElevatedButton(
                  child: Text("방제목 : " + document["방이름"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Jua',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff55CED6),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => StartPage(),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}