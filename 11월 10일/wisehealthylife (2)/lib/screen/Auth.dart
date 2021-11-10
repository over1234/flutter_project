import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wisehealthylife/provider/Thankyou.dart';
import 'package:wisehealthylife/provider/Timer.dart';
import 'package:wisehealthylife/provider/loading.dart';
import 'package:wisehealthylife/provider/pedometer.dart';
import 'package:wisehealthylife/provider/warmupSpeedMachine.dart';
import 'package:transition/transition.dart';

class HealMeApp extends StatefulWidget {
  final String roomID;
  const HealMeApp({Key? key, required this.roomID}) : super(key: key);

  @override
  _HealMeAppState createState() => _HealMeAppState(roomID: this.roomID);
}

class _HealMeAppState extends State<HealMeApp> {
  late final String roomID;
  _HealMeAppState({required this.roomID});
  callPermission() async {
    var status = await Permission.location.request();

    print(status);

    if (status.isGranted) {
      Navigator.push(
        context,
        Transition(
            child: Speed(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
      );
    }

    if (status.isDenied) {
      showDialog(
          context: context,
          //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: <Widget>[
                  new Text(
                    "권환 설정에 관해서",
                    style: TextStyle(fontSize: 15, fontFamily: 'Jua'),
                  ),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "인증을 위해 권환 설정을 확인해주세요.",
                    style: TextStyle(fontSize: 40, fontFamily: 'Jua'),
                  ),
                ],
              ),
              actions: <Widget>[
                new FloatingActionButton(
                  child: new Text("권한 설정 하러 가기"),
                  onPressed: () {
                    openAppSettings();
                  },
                  backgroundColor: const Color(0xff444D6A),
                ),
              ],
            );
          });
    }
  }

  interbal() {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              callPermission();
            },
            icon:
                Icon(Icons.run_circle_outlined, color: Colors.black, size: 100),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              minimumSize: Size(350, 200), // background// foreground
            ),
            label: Text(''),
          ),
          Text(
            "러닝\n인증하기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jua',
            ),
          ),
        ],
      ),
    );
  }

  Widget _timer() {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                Transition(
                    child: TimerPage(),
                    transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
              );
            },
            icon: Icon(Icons.smartphone, color: Colors.black, size: 100),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              minimumSize: Size(350, 200), // background// foreground
            ),
            label: Text(''),
          ),
          Text(
            "사용 시간\n인증하기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jua',
            ),
          ),
        ],
      ),
    );
  }

  joging() {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                Transition(
                    child: Walk(),
                    transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
              );
            },
            icon: Icon(
              Icons.directions_walk,
              color: Colors.black,
              size: 100,
            ),
            label: Text(""),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              minimumSize: Size(350, 200), // background// foreground
            ),
          ),
          Text(
            "걷기\n인증하기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jua',
            ),
          ),
        ],
      ),
    );
  }

  lux() {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                Transition(
                    child: Walk(),
                    transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
              );
            },
            icon: Icon(Icons.lightbulb, color: Colors.black, size: 100),
            label: Text(""),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              minimumSize: Size(350, 200), // background// foreground
            ),
          ),
          Text(
            "밝기\n인증하기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jua',
            ),
          ),
        ],
      ),
    );
  }

  tankyou() {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                Transition(
                    child: ThanksPage(),
                    transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
              );
            },
            icon: Icon(Icons.spellcheck, color: Colors.black, size: 100),
            label: Text(""),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              minimumSize: Size(350, 200), // background// foreground
            ),
          ),
          Text(
            "고운말\n인증하기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jua',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('PrivateRoom')
            .doc(roomID)
            .get(), // 문제의 '그' 코드 여러가지 문서에 드나들 수 있도록 문서 ID를 받아야하는데 ID를 받는 방법을 모르겠습니다.
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터가 로딩 중일때
            return Loading();
          }

          if (!snapshot.hasData) {
            // 데이터가 없다면
            return Scaffold(
              body: Center(),
            );
          }

          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          String misson = data['Misson'];
          print('$misson');

          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 280.0, 0.0),
                    child: Text(
                      '인증하기',
                      style: TextStyle(
                        fontSize: 25,
                        color: const Color(0xff55CED6),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jua',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  if (misson == '핸드폰 사용하지않기')
                    _timer()
                  else if (misson == '걷기')
                    joging()
                  else if (misson == '어두운 곳에서 휴대폰 사용하지않기')
                    lux()
                  else if (misson == '러닝')
                    interbal()
                  else if (misson == '감사와 관련된 말 3개 쓰기')
                    tankyou()
                  else
                    Text('일치되는 미션 없음')
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
