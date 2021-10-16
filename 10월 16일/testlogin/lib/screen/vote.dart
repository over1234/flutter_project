import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter_countdown_timer/index.dart';
import 'package:testlogin/screen/tarm.dart';
import 'package:transition/transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: VotePage(),
    );
  }
}

bool pressed = false;

bool pressed1 = false;

bool pressed2 = false;

bool pressed3 = false;

bool pressed4 = false;

bool dpressed1 = false;

bool dpressed2 = false;

bool dpressed3 = false;

bool dpressed4 = false;

bool dpressed5 = false;

/// This

/// is the stateless widget that the main application instantiates.

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  int _counter = 0;

  int _counter1 = 0;

  int _counter2 = 0;

  int _counter3 = 0;

  int _counter4 = 0;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  void _incrementCountdown() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCountdown1() {
    setState(() {
      _counter1--;
    });
  }

  void _incrementCountdown2() {
    setState(() {
      _counter2--;
    });
  }

  void _incrementCountdown3() {
    setState(() {
      _counter3--;
    });
  }

  void _incrementCoundown4() {
    setState(() {
      _counter4--;
    });
  }

  //감소하는 카운터ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _incrementCounter3() {
    setState(() {
      _counter3++;
    });
  }

  void _incrementCounter4() {
    setState(() {
      _counter4++;
    });
  }

  //증가하는 카운터ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text('미션 투표',
                style: TextStyle(
                    color: const Color(0xff55CED6),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 2.0,
                  width: 500,
                  color: const Color(0xff55CED6),
                ),

                SizedBox(
                  height: 15,
                ),

                Text(
                  '제한시간',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff55CED6),
                      fontWeight: FontWeight.bold),
                ),

                CountdownTimer(
                  endTime: endTime,
                  onEnd: () {
                    Navigator.push(
                      context,
                      Transition(
                          child: TermPage(),
                          transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                    );
                  },
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return Text(
                        '제한시간이 끝났습니다',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      );
                    }
                    return Text(
                      '${time.sec}',
                      style: TextStyle(fontSize: 45, color: Colors.black),
                    );
                  },
                ),

                SizedBox(
                  height: 120,
                ),

                //제한시간ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  OutlinedButton(
                      onPressed: dpressed1
                          ? null
                          : () {
                        if (pressed) {
                          pressed = false;
                          _incrementCountdown();
                          dpressed2 = false;
                          dpressed3 = false;
                          dpressed4 = false;
                          dpressed5 = false;
                        } else {
                          pressed = true;
                          _incrementCounter();
                          dpressed2 = true;
                          dpressed3 = true;
                          dpressed4 = true;
                          dpressed5 = true;
                        }
                      },
                      child: Text(
                        '휴대폰4시간 이상 사용 금지',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff444D6A),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: pressed
                            ? const Color(0xff55CED6)
                            : const Color(0xffDCF7F9),
                        minimumSize: Size(290, 50),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(fontSize: 30),
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                //11111111111111111111111111111111111111

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  OutlinedButton(
                      onPressed: dpressed2
                          ? null
                          : () {
                        if (pressed1) {
                          pressed1 = false;
                          dpressed1 = false;
                          dpressed3 = false;
                          dpressed4 = false;
                          dpressed5 = false;
                          _incrementCountdown1();
                        } else {
                          pressed1 = true;
                          dpressed1 = true;
                          dpressed3 = true;
                          dpressed4 = true;
                          dpressed5 = true;

                          _incrementCounter1();
                        }
                      },
                      child: Text(
                        '누워있기',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff444D6A),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: pressed1
                            ? const Color(0xff55CED6)
                            : const Color(0xffDCF7F9),
                        minimumSize: Size(290, 50),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$_counter1',
                    style: TextStyle(fontSize: 30),
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                //2222222222222222222222222222222222222222222222

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  OutlinedButton(
                      onPressed: dpressed3
                          ? null
                          : () {
                        if (pressed2) {
                          pressed2 = false;
                          dpressed1 = false;
                          dpressed2 = false;
                          dpressed4 = false;
                          dpressed5 = false;

                          _incrementCountdown2();
                        } else {
                          pressed2 = true;
                          dpressed1 = true;
                          dpressed2 = true;
                          dpressed4 = true;
                          dpressed5 = true;

                          _incrementCounter2();
                        }
                      },
                      child: Text(
                        '휴대폰4시간 이상 사용 금지',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff444D6A),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: pressed2
                            ? const Color(0xff55CED6)
                            : const Color(0xffDCF7F9),
                        minimumSize: Size(290, 50),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$_counter2',
                    style: TextStyle(fontSize: 30),
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                //33333333333333333333333333333333333333333333333333

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  OutlinedButton(
                      onPressed: dpressed4
                          ? null
                          : () {
                        if (pressed3) {
                          pressed3 = false;
                          dpressed1 = false;
                          dpressed2 = false;
                          dpressed3 = false;
                          dpressed5 = false;

                          _incrementCountdown3();
                        } else {
                          pressed3 = true;
                          dpressed1 = true;
                          dpressed2 = true;
                          dpressed3 = true;
                          dpressed5 = true;

                          _incrementCounter3();
                        }
                      },
                      child: Text(
                        '휴대폰4시간 이상 사용 금지',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff444D6A),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: pressed3
                            ? const Color(0xff55CED6)
                            : const Color(0xffDCF7F9),
                        minimumSize: Size(290, 50),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$_counter3',
                    style: TextStyle(fontSize: 30),
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                //444444444444444444444444444444444444444444444

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  OutlinedButton(
                      onPressed: dpressed5
                          ? null
                          : () {
                        if (pressed4) {
                          pressed4 = false;
                          dpressed1 = false;
                          dpressed2 = false;
                          dpressed3 = false;
                          dpressed4 = false;

                          _incrementCoundown4();
                        } else {
                          pressed4 = true;
                          dpressed1 = true;
                          dpressed2 = true;
                          dpressed3 = true;
                          dpressed4 = true;

                          _incrementCounter4();
                        }
                      },
                      child: Text(
                        '휴대폰4시간 이상 사용 금지',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff444D6A),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: pressed4
                            ? const Color(0xff55CED6)
                            : const Color(0xffDCF7F9),
                        minimumSize: Size(290, 50),
                        side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$_counter4',
                    style: TextStyle(fontSize: 30),
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                //555555555555555555555555555555555555
              ],
            ),
          ),
        );
      },
    );
  }
}