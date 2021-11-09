//게임 시작전 사설방 로비 화면입니다

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisehealthylife/provider/loading.dart';
import 'package:wisehealthylife/screen/vote.dart';
import 'package:transition/transition.dart';
import 'package:uuid/uuid.dart';
import 'chatting.dart';
import 'lobi.dart';

import 'dart:developer';

/// This
/// is the stateless widget that the main application instantiates.
class StartPage extends StatefulWidget {
  final String roomID;

  const StartPage({Key? key, required this.roomID}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState(roomID: this.roomID);
}

class _StartPageState extends State<StartPage> {
  GlobalKey<AnimatedListState> _animListKey =
      GlobalKey<AnimatedListState>(); // 챗
  TextEditingController _textEditingController = TextEditingController(); // 챗
  List<String> _chats = []; // 챗
  CollectionReference room =
      FirebaseFirestore.instance.collection('PrivateRoom'); // 컬렉션을 변수로 저장하여 편하게

  final String roomID;
  _StartPageState({required this.roomID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      // 데이터를 받아옴
      future: room
          .doc(roomID)
          .get(), // 문제의 '그' 코드 여러가지 문서에 드나들 수 있도록 문서 ID를 받아야하는데 ID를 받는 방법을 모르겠습니다.
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          // 데이터가 없다면
          return Scaffold(
            body: Center(),
          );
        }

        log((snapshot.data != null).toString());

        Map<String, dynamic> data = snapshot.data?.data()
            as Map<String, dynamic>; // 여러 데이터들을 분리하여 받아내는...

        var roomKey = FirebaseFirestore.instance
            .collection('PrivateRoom')
            .doc(roomID)
            .get()
            .then((doc) {
          "roomkey";
        });

        if (data != null) {
          var id = data['id'];
          print(id);

          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터가 로딩 중일때
            return Loading();
          }

          return Scaffold(
            // 본 메인 화면
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              title:
                  Text('${data['roomName']} ${data['Count']}/10', // 이름과 인원 수...
                      style: TextStyle(
                        color: const Color(0xff55CED6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jua',
                      )),
              backgroundColor: Colors.white,
              centerTitle: true,
              iconTheme: IconThemeData(color: const Color(0xff55CED6)),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12, right: 8.0),
                  child: Container(
                    width: 74,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          Transition(
                              child: Lobby(),
                              transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                        );
                      },
                      child: Text(
                        // 방에서 나가는...
                        '나가기',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jua',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA)),
                    ),
                  ),
                )
              ],
            ),
            drawer: Container(
              width: 200,
              child: Drawer(
                child: Container(
                    padding: EdgeInsets.only(top: 50),
                    color: const Color(0xffDCF7F9),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: [
                            Center(
                              child: Text(
                                "ROOM MAIN",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: const Color(0xff55CED6),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jua',
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 150,
                                height: 2,
                                color: const Color(0xff55CED6),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('초대 링크'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    '방 코드는 ${data['roomKey']} 입니다'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ok')),
                                          ],
                                        );
                                      });
                                },
                                child: Text(
                                  "초대하기",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xff55CED6),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Jua',
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(100, 35),
                                    primary: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              "왼쪽으로",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color(0xff55CED6),
                                fontFamily: 'Jua',
                              ),
                            )),
                            Center(
                                child: Text(
                              "밀어서 닫기",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color(0xff55CED6),
                                fontFamily: 'Jua',
                              ),
                            )),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        room.doc(id).update({
                          'Start?': true
                        }); // 누르면 시작을 true로 바꾸면서 시작했음을 알려주는 변수
                        Navigator.push(
                          context,
                          Transition(
                              child: VotePage(roomID: roomID),
                              transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                        );
                      },
                      child: Text(
                        "GAME START",
                        style: TextStyle(
                          fontSize: 53,
                          color: const Color(0xffFF5C7A),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(100, 35),
                        side: BorderSide(
                          width: 5.0,
                          color: const Color(0xffFF5C7A),
                          style: BorderStyle.solid,
                        ),
                      )),
                  Expanded(
                    child: AnimatedList(
                      reverse: true,
                      key: _animListKey,
                      itemBuilder: _buildItem,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: "메세지 입력창",
                              hintStyle: TextStyle(
                                color: const Color(0xff55ced6),
                                fontFamily: 'Jua',
                              ),
                            ),
                            onSubmitted: _handleSubmitted,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        // ignore: deprecated_member_use
                        FloatingActionButton(
                          onPressed: () {
                            _handleSubmitted(_textEditingController.text);
                          },
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.black,
                            size: 42,
                          ),
                          backgroundColor: const Color(0xffAEE6EA),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(),
          );
        }
      },
    );
  }

  Widget _buildItem(context, index, animation) {
    return Chatmessage(
      _chats[index],
      animation: animation,
    );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    _chats.insert(0, text);
    _animListKey.currentState!.insertItem(0);
  }
}
