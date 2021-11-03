import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testlogin/provider/loading.dart';
import 'game_main_screen.dart';
import 'game_sub_screen.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final user = FirebaseAuth.instance.currentUser; // 문서 ID용
  final FirebaseAuth _auth = FirebaseAuth.instance; // 문서 ID용
  late String? username = user?.displayName; // 방장 불러오기
  bool roomIn = false; // 사용자가 방에 들어와있는가?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('PrivateRoom')
            .snapshots(includeMetadataChanges: true), // 데이터 실시간으로 받기
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            // 만약에 데이터가 없다면
            return Scaffold(
              body: Center(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터를 받는 중이라면
            return Loading();
          }
          return ListView(
            // 데이터 나열
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              List<dynamic> userlist = data["Users"] as List; // 방 인원 수 배열로 확인
              bool start = data['Start?']; // 게임 스타트 유무 확인

              return Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 100,
                child: ElevatedButton(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "방제목 : " + data["roomName"], // 방제목 쿼리
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Jua',
                          ),
                        ),
                        subtitle: Text(
                          '방 인원 수 : ${data['Count']}/10', // 인원 수 쿼리
                          style: TextStyle(fontSize: 15, fontFamily: 'Jua'),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffDCF7F9),
                    shape: RoundedRectangleBorder(
                        //버튼을 둥글게 처리
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    final user = _auth.currentUser;
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(user?.uid)
                        .get()
                        .then((DocumentSnapshot ds) {
                      String username = ds['username'];
                      FirebaseFirestore.instance
                          .collection("PrivateRoom")
                          .doc(document.id)
                          .update({
                        "Users": FieldValue.arrayUnion([username])
                      }); // 방 클릭시 유저 배열에 업데이트하기
                    });

                    FirebaseFirestore.instance
                        .collection('Users')
                        .doc(user?.uid)
                        .update({
                      'roomInList': FieldValue.arrayUnion(data['roomName'])
                    });

                    for (var j = 0;
                        j < userlist.length;
                        j++) // 유저리스트를 다 읽어서 내가 그 리스트에 있으면 방 안에 있다고 인식!
                    {
                      if (username == userlist[j]) {
                        roomIn = true;
                      }
                    }

                    var count = 0;
                    for (var i = 0; i < userlist.length; i++) // 유저 인원 수 측정
                    {
                      count++;
                    }
                    if (start != true) // 게임이 시작했는가?
                    {
                      if (count <= 10) // 카운터 10 미만이면
                      {
                        FirebaseFirestore.instance
                            .collection("PrivateRoom")
                            .doc(document.id)
                            .update({"Count": count}); // 카운터를 올린다
                        Navigator.push(
                          // 게임 화면으로 이동
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => StartPage(),
                          ),
                        );
                      } else {
                        _showMyDialog(); // 방이 꽉차있음을 알림
                      }
                    } else {
                      if (roomIn == true) // 사용자가 들어가있는 상태에서 10명이 다 차면
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) =>
                                    SubPage())); // 바로 서브페이지로 이동(미션 스킵)
                      } else {
                        _showMyDialog1(); // 시작했음을 알림
                      }
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
