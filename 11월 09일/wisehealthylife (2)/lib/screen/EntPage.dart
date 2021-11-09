import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:wisehealthylife/provider/RoomKey.dart';
import 'package:firebase_core/firebase_core.dart';
import 'lobi.dart';


class Entpage extends StatefulWidget {
  const Entpage({Key? key}) : super(key: key);

  @override
  _EntpageState createState() => _EntpageState();
}

enum OPEN {TRUE, FALSE}
//공개 비공개 하는 설정을 위한 변수

class _EntpageState extends State<Entpage> {

  final docRef = FirebaseFirestore.instance.collection('PrivateRoom').doc();
  //firebase에 'PrivateRoom' 이라는 큰 단락으로 올리는 변수

  final DateTime timestamp = DateTime.now();
  TextEditingController controller = TextEditingController();
  //방 이름을 저장할 변수
  TextEditingController controller2 = TextEditingController();
  var u = Uuid().v1();
  //이름 관련한 라이브러리

  List _valueList = ['5','6','7','8','9','10'];
  var _selectedValue = '5';
  // dropdownButton에 필요한 List(그냥 인원수)

  static const String CHATROOM = 'ChatRooM';
  var now = DateTime.now().microsecondsSinceEpoch;

  Stream<QuerySnapshot> getSnapshot(){
    final f = FirebaseFirestore.instance;
    //만약 올리는 시간이 현재보다 더 뒤라면 올리는 함수
    return f.collection(CHATROOM).limit(1).orderBy('uploadTime', descending: true).snapshots();
  }
  bool make = false;
  int _counter = 0;
  var _isChecked = false;
  OPEN _open = OPEN.TRUE;
//dropdownButton 관련된 변수들(기본 값들)

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        centerTitle:true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        //바로 전 페이지로 가는 화살표를 없앰
      ),
      body: Builder (
        builder: (context) {
          return GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Form(
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 16.0
                              )
                          )
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 42.0,right: 42.0,top: 0.0,bottom: 0.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 270.0),
                              child: IconButton(
                                //메인 페이지로 돌아가는 버튼
                                icon: Icon(Icons.dangerous_rounded),
                                color: const Color(0xffAEE6EA),
                                iconSize: 43.0,
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (BuildContext)=> Lobby()));
                                },
                                //나가는 버튼
                              ),
                            ),
                            TextField(
                              autofocus: true,
                              //내가 어디에 쓰고 있는지 focus를 해줌
                              controller: controller,
                              //위에 변수를 controller로 선언해줌
                              decoration: InputDecoration(
                                labelText: '방 제목',
                                labelStyle: TextStyle(
                                  color: const Color(0xff55ced6),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              //키보드에 @도 편하게 쓸 수 있게 나와있는 형태의 키보드를 사용함
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            ButtonTheme(
                              minWidth: 250.0,
                              height: 80.0,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                //만약 방 이름이 있다면, 메인 채팅방으로 보내주는 버튼
                                color: const Color(0xffAEE6EA),
                                child: Text('방 만들기',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  //방 만들기 버튼
                                ),
                                onPressed: () async {
                                  setCode roomkey = new setCode();
                                  if(controller.text != '' ) {
                                    //방 이름이 어떤 이름이라도 있다면 메인 채팅창으로 보내줌
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> Lobby()));
                                    var count = 0;
                                    final db = FirebaseFirestore.instance;
                                    await db.collection('PrivateRoom').doc(docRef.id).set({
                                      'Misson' : ".",
                                      "PublicOpen" : true,
                                      "Start?" : false,
                                      "Time" : timestamp,
                                      "Users" : FieldValue.arrayUnion([]),
                                      "roomKey" : roomkey.roomkey1,
                                      "roomName" : controller.text,
                                      "Count" : count,
                                    });
                                    //updateDoc('RoomName', controller.text);
                                    print('방 이름이 설정되었습니다.');
                                  } else {
                                    //만약 방 이름이 아무것도 없다면 방 이름이 없다는 스낵바를 띄어줌
                                    showSnackBar(context);
                                  }
                                  //방 만들기 설정하는 채팅
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      ),

    );

  }
}

void showSnackBar(BuildContext context) {
  // ignore: deprecated_member_use
  //위에 스낵바 변수 부분
  //가장 하단에 방 제목이 설정되어있지 않다는 바를 2초동안 띄어줌
  Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('방 제목이 설정되어있지 않습니다!',
        textAlign: TextAlign.center,
      ),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xff55CED6),
// 만약 방 이름을 설정하지 않았을 때 나오는 스낵바
      )
  );
}
