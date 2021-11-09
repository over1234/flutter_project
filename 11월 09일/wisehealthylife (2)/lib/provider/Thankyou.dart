import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisehealthylife/provider/ChatModel.dart';
import 'package:wisehealthylife/screen/Entpage.dart';
import 'package:wisehealthylife/screen/Chatmessage.dart';
import 'package:wisehealthylife/provider/Chatprovider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'Chatprovider.dart';

class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();
  //입력한 text를 받는 controller
  late StreamSubscription _streamSubscription;
  String a = '!';
  bool firstLoad = true;
  List<String> _Chats = [];

  @override
  void initState() {
    var p = Provider.of<Chatprovider>(context, listen: false);
    //chatprovider과의 연결(변수 p)
    _streamSubscription = p.getSnapshot().listen((event) {
      if (firstLoad) {
        firstLoad = false;
        return;
      }
      p.addOne(
          ChatModel.fromJson(event.docs[0].data() as Map<String, dynamic>));
      //chatModel에 있는 json에 넣기 위해 설정
    });
    Future.microtask(() {
      p.load();
      //chatprovider과 연결해 그 안에있는 load 함수 사용
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<Chatprovider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '채팅 방',
            //위에 appbar에 채팅 방 이라 뜸
            style: TextStyle(
              color: const Color(0xff55ced6),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // iconTheme: IconThemeData(
          //   color: const Color(0xff55ced6),
          // ),
          actions: <Widget>[
            ButtonTheme(
              // ignore: deprecated_member_use
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12, right: 8.0),
                child: Container(
                  width: 74.0,
                  height: 8.0,
                  child: ElevatedButton(
                    child: Text(
                      "나가기",
                      //오른쪽 위 버튼이 있는데, 로비 페이지로 돌아가는 버튼
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff55CED6), // background
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => Fourthpage()));
                    },
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          //배경색을 흰색으로 해줌
          elevation: 0,
          automaticallyImplyLeading: false,
          //바로 전 페이지로 가는 이동 화살표를 없앰.(이상한 곳으로 가지 않게)
        ),
        drawer: Container(
          width: 200,
          child: Center(
            child: Drawer(
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  color: const Color(0xffDCF7F9),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "ROOM MAIN",
                            style: TextStyle(
                                fontSize: 30,
                                color: const Color(0xff55CED6),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 170,
                            height: 5,
                            color: const Color(0xff55CED6),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "초대하기",
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff55CED6),
                                //Column에 있는 것들은 전부 다 햄버거 바(왼쪽 위)
                                //에 있는 Text들(초대하기, 인원 보기)
                              ),
                            ),
                          ),
                          ListTile()
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                reverse: true,
                children:
                    p.ChatList.map((e) => Chatmessage(chatModel: e)).toList(),
                //Listvier를 사용해서 올라오는 채팅들을 넣어줌
                //이 때 reverse를 사용해서 아래 -> 위 로 채팅이 올라오게 함
              ),
            ),
            Divider(
              thickness: 1.5,
              height: 1.0,
              color: Colors.cyanAccent[100],
              //밑의 Textrield와 위에 Listview를 가르는 얇은 선
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: TextFormField(
                        autofocus: true,
                        //내가 채팅을 치고 있는 곳을 focus 해줌
                        maxLines: null,
                        //채팅을 칠 때 여러 줄을 칠 수 있게 해줌(line을 설정해두지 않아 많이 되게)
                        controller: _textEditingController,
                        //위에 지정해둔 변수를 controller로 선언해줌
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '텍스트 입력',
                            //입력하는 곳에 텍스트 입력 이라 뜸
                            hintStyle:
                                TextStyle(color: const Color(0xffAEE6EA))),
                        textInputAction: TextInputAction.next,
                        validator: (text) {
                          if (text!.isNotEmpty) {
                            //만약 채팅이 없을 경우 올리지 못하게 함
                            return ' ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      //보내기 버튼
                      //눌렀을 시 채팅 치는 곳을 비운 뒤, 그 값을 보내줌
                      var text = _textEditingController.text;
                      _textEditingController.text = '';
                      p.send(text);
                      //p 변수를 사용해서 TextformField에 띄우게 함
                    },
                    child: Text("Send"),
                    color: const Color(0xffAEE6EA),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ElevatedButton(
                    //미션 중 감사한 말 n개 하기로 보내는 버튼
                    child: Text(
                      "!감사",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff55CED6), // background
                    ),
                    onPressed: () {
                      //눌렀을 시 그 페이지로 이동하게 함
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => ThanksPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StreamSubscription>(
        '_streamSubscription', _streamSubscription));
  }
}

class ThanksPage extends StatefulWidget {
  @override
  _ThanksPageState createState() => _ThanksPageState();
}

class _ThanksPageState extends State<ThanksPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var u = Uuid().v1();
  //Uuid(이름 관련한 라이브러리)를 변수 u로 선언해줌

  TextEditingController _textEditingController = TextEditingController();

  late StreamSubscription _streamSubscription;

  String a = '!';

  bool firstLoad = true;
  //위의 형태와 크게 다르지 않음

  @override
  void initState() {
    var p = Provider.of<Chatprovider>(context, listen: false);
    //Thankprovider과 연결해줌
    _streamSubscription = p.getSnapshot().listen((event) {
      if (firstLoad) {
        firstLoad = false;
        return;
      }
      p.addOne(
          ChatModel.fromJson(event.docs[0].data() as Map<String, dynamic>));
      //ThankModel의 json과 연결해줘 DB전송을 함
    });
    Future.microtask(() {
      p.load();
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<Chatprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "감사한 말 쓰기",
          //감사한 말 쓰기 라는 페이지를 나타냄
          style: TextStyle(
            color: const Color(0xff55ced6),
          ),
        ),
        actions: <Widget>[
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
                    //버튼을 눌렀을 시, 채팅창이 있던 페이지로 돌아가는 버튼
                    child: Text(
                      "돌아가기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.4,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff55CED6), // background
                    ),
                    onPressed: () {
                      //눌렀을 시 채팅창이 있는 페이지로 이동함
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => ThirdPage()));
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
        //바로 전 페이지로 가는 이동 화살표를 없앰.(이상한 곳으로 가지 않게)
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              reverse: true,
              //채팅이 올라올 때 아래 -> 위 순서로 올라오게 해줌
              children:
                  p.ChatList.map((e) => Chatmessage(chatModel: e)).toList(),
              //Thankmessage와 연결해줘 메인 채팅창과 혼동되지 않게 함
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: _textEditingController,
                      //위에 Thankpage에서 선언해준 controller를 선언함
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '텍스트 입력',
                          //채팅을 쓸 곳에 텍스트 입력이라 뜨게 함(그러나 그게 채팅에 들어가지 않음)
                          hintStyle: TextStyle(color: const Color(0xffAEE6EA))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                  //채팅창과 버튼 사이를 조금 띄움
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    if (controller.text != '') {
                      //보내기 버튼
                      //만약 채팅에 아무것이라도 적혀 있다면 DB에 감사한 말을 올림
                      upDateDoc();
                      print('감사한 말!');
                      //확인용으로 플러터에서 띄어봄
                    }
                    var text = _textEditingController.text;
                    _textEditingController.text = '';
                    //그리고 채팅을 초기화시킴
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xffAEE6EA),
                ),
                SizedBox(
                  width: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> upDateDoc() async {
  //감사한 말을 firebase에 올리는 함수
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  var rName = {'감사한 말': controller.text};
  final db = FirebaseFirestore.instance;
  //db에 올릴 때, 감사한 말로 어떤 말을 했는지 알 수 있게 controller을 직접 올림
  await db.collection('ThanksTalk').add(rName).then((res) => {
        print('감사한 말이 등록 되었습니다'),
      });
}

class Fourthpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Entpage();
  }
}
