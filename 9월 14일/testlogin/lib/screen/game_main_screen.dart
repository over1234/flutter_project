import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlogin/screen/vote.dart';
import 'chatting.dart';

/// This

/// is the stateless widget that the main application instantiates.

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();

  List<String> _chats = [];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('지존용제나이트 8/10',
            style: TextStyle(
                color: const Color(0xff55CED6),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: const Color(0xff55CED6)),
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
                              fontWeight: FontWeight.bold),
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
                          onPressed: () {},
                          child: Text(
                            "초대하기",
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color(0xff55CED6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 35),
                              primary: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("용제팬태영",
                                style: TextStyle(
                                    color: const Color(0xff55CED6),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, bottom: 12, top: 12, left: 10),
                        height: 54,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: const Color(0xff55CED6),
                                )),
                            color: Colors.white),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xff55CED6),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("준서나이트",
                                style: TextStyle(
                                    color: const Color(0xff55CED6),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                            "왼쪽으로",
                            style: TextStyle(
                                fontSize: 20, color: const Color(0xff55CED6)),
                          )),
                      Center(
                          child: Text(
                            "밀어서 닫기",
                            style: TextStyle(
                                fontSize: 20, color: const Color(0xff55CED6)),
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
            Container(
              padding: EdgeInsets.only(bottom: 1, left: 10),
              height: 100,
              width: 500,
              color: const Color(0xffAEE6EA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "zㅣ존용제",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "광신도",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "MC근찬",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "준서나이트",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "월광현우",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "용제팬수현",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Text(
                            "용제팬가연",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff444D6A),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 90,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Text(
                          "용제팬태영",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xff444D6A),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => VotePage(),
                    ),
                  );
                },
                child:
                    Text(
                      "GAME START",
                      style: TextStyle(
                        fontSize: 60,
                        color: const Color(0xffFF5C7A),
                      ),
                    ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(190, 35),
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
                      decoration: InputDecoration(hintText: "메세지 입력창",
                        hintStyle: TextStyle(
                          color: const Color(0xff55ced6),
                        ),
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                    child: Text("Send"),
                    color: const Color(0xffAEE6EA),
                  ),
                ],
              ),
            ),
            ],
        ),
      ),
    );
  }
  Widget _buildItem(context, index, animation)  {
    return Chatmessage(_chats[index], animation:animation, );
  }


  void _handleSubmitted(String text) {
    _textEditingController.clear();
    _chats.insert(0, text);
    _animListKey.currentState!.insertItem(0);
  }
}