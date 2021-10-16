import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/screen/game_sub_screen.dart';
import 'package:uuid/uuid.dart';
import 'Chatmassage.dart';


class ThanksPage extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var u = Uuid().v1();

  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();
  String a = '!';

  List<String> _Chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text("감사한 말 쓰기",
            style: TextStyle(
              color: const Color(0xff55ced6),
            ),
          ),
          actions: <Widget> [
            ButtonTheme(
              // ignore: deprecated_member_use
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12, right: 8.0),
                child: Container(
                  width: 74.0,
                  height: 8.0,
                  child: ButtonTheme(
                    minWidth: 10.0,
                    child: ElevatedButton(
                      child: Text("돌아가기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.4,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff55CED6), // background
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> SubPage()));
                        // 메인채팅방으로 이동함
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
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
                    upDateDoc();
                  },
                    child: Text("Send"),
                    color: const Color(0xffAEE6EA),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                ],
              ),
            ),
          ],
        )

    );
  }
  Widget _buildItem(context, index, animation)  {
    return Chatmessage(_Chats[index], animation:animation, );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    _Chats.insert(0, text);
    _animListKey.currentState!.insertItem(0);
  }
}

Future <void> upDateDoc() async {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  var rName = {'감사한 말' : controller.text };
  final db = FirebaseFirestore.instance;
  await db.collection('ThanksTalk').add(rName).then((res)=>{
    print('감사한 말이 등록 되었습니다'),
  });

}