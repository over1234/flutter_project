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
        stream: FirebaseFirestore.instance.collection('PrivateRoom').snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Scaffold(
              body: Center(

              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              List<dynamic> user = data["Users"] as List;


              return Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 100,
                child: ElevatedButton(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("방제목 : " + data["roomName"],
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black, fontFamily: 'Jua',
                          ),
                        ),
                        subtitle: Text(
                            '방 인원 수 : ${data['Count']}/10',
                          style: TextStyle(
                            fontSize: 15, fontFamily: 'Jua'
                          ),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffDCF7F9),
                    shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    var count = 0;
                    for(var i = 0; i < user.length; i++)
                      {
                        count++;
                      }
                    if(count <= 10)
                      {
                        FirebaseFirestore.instance.collection("PrivateRoom").doc(document.id).update({"Count" : count});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => StartPage(),
                          ),
                        );
                      }
                    else
                      {
                        _showMyDialog();
                      }
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('인원 수 초과!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('현재 방 인원 수가 초과되었습니다. 다른 방에 접속하여 게임을 즐겨주세요.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('돌아가기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('게임 시작!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('현재 이 방은 이미 게임을 시작하였습니다. 다른 방을 알아봐주실래요?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('돌아가기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}