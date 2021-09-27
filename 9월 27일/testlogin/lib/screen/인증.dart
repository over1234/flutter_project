import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testlogin/provider/Camra.dart';
import 'package:testlogin/provider/Timer.dart';
import 'package:testlogin/provider/pedometer.dart';
import 'package:transition/transition.dart';

class HealMeApp extends StatefulWidget {
  const HealMeApp({Key? key}) : super(key: key);

  @override
  _HealMeAppState createState() => _HealMeAppState();
}

class _HealMeAppState extends State<HealMeApp> {

  callPermission() async {
    var status = await Permission.camera.request();

    print(status);

    if (status.isGranted) {
      Navigator.push(
        context,
        Transition(
            child: CameraPicture(),
            transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
      );
    }

    if(status.isDenied) {
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
                  new Text("권환 설정에 관해서",
                    style: TextStyle(fontSize: 15, fontFamily: 'Jua'),),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("인증을 위해 권환 설정을 확인해주세요.",
                    style: TextStyle(fontSize: 40, fontFamily: 'Jua'),),
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

  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 280.0, 0.0),
                  child: Text('인증하기',
                    style: TextStyle(
                      fontSize: 25, color: const Color(0xff55CED6), fontWeight: FontWeight.bold, fontFamily: 'Jua',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 28.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          callPermission();
                        },
                        icon:  Icon(Icons.run_circle_outlined, color: Colors.black, size: 100),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ), label: Text(''),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            Transition(
                                child: TimerPage(),
                                transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                          );
                        },
                        icon:  Icon(Icons.smartphone, color: Colors.black, size: 100),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),label: Text(''),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 60.0, 0.0),
                      ),
                      Text("스트레칭", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                      Container(
                        padding: EdgeInsets.only(right: 130.0),
                      ),
                      Text("사용 시간", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 28.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            Transition(
                                child: Walk(),
                                transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                          );
                        },
                        icon:  Icon(Icons.directions_walk, color: Colors.black, size: 100,),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          callPermission();
                        },
                        icon:  Icon(Icons.lunch_dining, color: Colors.black, size: 100),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
                      ),
                      Text("조깅", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                      Container(
                        padding: EdgeInsets.only(right: 145.0),
                      ),
                      Text("식단", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 28.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          callPermission();
                        },
                        icon:  Icon(Icons.brunch_dining, color: Colors.black, size: 100),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          callPermission();
                        },
                        icon:  Icon(Icons.sports_kabaddi, color: Colors.black, size: 100),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 75.0, 0.0),
                      ),
                      Text("식습관", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                      Container(
                        padding: EdgeInsets.only(right: 145.0),
                      ),
                      Text("운동", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 28.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          callPermission();
                        },
                        icon:  Icon(Icons.monitor_weight, color: Colors.black, size: 100),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            Transition(
                                child: TimerPage(),
                                transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                          );
                        },
                        icon:  Icon(Icons.hotel, color: Colors.black, size: 100),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffAEE6EA),
                          minimumSize: Size(100, 100),// background// foreground
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 60.0, 0.0),
                      ),
                      Text("다이어트", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
                      Container(
                        padding: EdgeInsets.only(right: 130.0),
                      ),
                      Text("수면 시간", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Jua',),),
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
}
 


