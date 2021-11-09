import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wisehealthylife/provider/loading.dart';
import 'package:wisehealthylife/screen/progress.dart';
import 'package:transition/transition.dart';
import 'Auth.dart';
import 'chatting.dart';
import 'lobi.dart';

/// This

/// is the stateless widget that the main application instantiates.

class SubPage extends StatefulWidget {
  final String roomID;

  const SubPage({Key? key, required this.roomID}) : super(key: key);

  @override
  _SubPageState createState() => _SubPageState(roomID: this.roomID);
}

class _SubPageState extends State<SubPage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();

  List<String> _chats = [];
  CollectionReference room =
      FirebaseFirestore.instance.collection('PrivateRoom');

  final String roomID;
  _SubPageState({required this.roomID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: room.doc(roomID).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          // 데이터가 없다면
          return Scaffold(
            body: Center(),
          );
        }

        Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;

        if (data != null) {
          var id = data['id'];
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          // 데이터가 로딩 중일때
          return Loading();
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text('${data['roomName']} ${data['Count']}/10',
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
                                Navigator.push(
                                  context,
                                  Transition(
                                      child: HealMeApp(roomID: roomID),
                                      transitionEffect:
                                          TransitionEffect.LEFT_TO_RIGHT),
                                );
                              },
                              child: Text(
                                "인증하기",
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
            //이 부분은 화면 위쪽에 유저 목록을 표시하는 위젯들인데, 무시하셔도 괜찮습니다.
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        Transition(
                            child: MyCustomGraph(), //그래프 화면으로 이동하여 줍니다.
                            transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                      );
                    },
                    child: Text(
                      "미션 진행현황 확인",
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color(0xffFF5C7A),
                        fontFamily: 'Jua',
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
