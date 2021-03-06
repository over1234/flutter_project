import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_countdown_timer/index.dart';

import 'game_sub_screen.dart';

void main() => runApp(const term());

class term extends StatelessWidget {
  const term({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: TermPage(),
    );
  }
}

bool pressed = false;

bool pressed1 = false;

bool pressed2 = false;

bool pressed3 = false;

bool pressed4 = false;

bool pressed5 = false;

bool pressed6 = false;

bool dpressed = false;

bool dpressed1 = false;

bool dpressed2 = false;

bool dpressed3 = false;

bool dpressed4 = false;

bool dpressed5 = false;

bool dpressed6 = false;

/// This

/// is the stateless widget that the main application instantiates.

class TermPage extends StatefulWidget {
  const TermPage({Key? key}) : super(key: key);

  @override
  _TermPageState createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  int _counter = 0;

  int _counter1 = 0;

  int _counter2 = 0;

  int _counter3 = 0;

  int _counter4 = 0;

  int _counter5 = 0;

  int _counter6 = 0;
  int end = 5;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;

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

  void _incrementCountdown4() {
    setState(() {
      _counter4--;
    });
  }

  void _incrementCountdown5() {
    setState(() {
      _counter5--;
    });
  }

  void _incrementCountdown6() {
    setState(() {
      _counter6--;
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

  void _incrementCounter5() {
    setState(() {
      _counter5++;
    });
  }

  void _incrementCounter6() {
    setState(() {
      _counter6++;
    });
  }

  //증가하는 카운터ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('기간 투표',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubPage()));
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

            SizedBox(height: 30),

            //제한시간ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed
                      ? null
                      : () {
                    if (pressed) {
                      pressed = false;
                      _incrementCountdown();
                      dpressed1 = false;
                      dpressed2 = false;
                      dpressed3 = false;
                      dpressed4 = false;
                      dpressed5 = false;
                      dpressed6 = false;
                    } else {
                      pressed = true;
                      _incrementCounter();
                      dpressed1 = true;
                      dpressed2 = true;
                      dpressed3 = true;
                      dpressed4 = true;
                      dpressed5 = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '1일',
                    style: TextStyle(
                        fontSize: 25,
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
              height: 10,
            ),
//1111111111111111111111111111111111111111111111111111111111111111111111111111111
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed1
                      ? null
                      : () {
                    if (pressed1) {
                      pressed1 = false;
                      _incrementCountdown1();
                      dpressed = false;
                      dpressed2 = false;
                      dpressed3 = false;
                      dpressed4 = false;
                      dpressed5 = false;
                      dpressed6 = false;
                    } else {
                      pressed1 = true;
                      _incrementCounter1();
                      dpressed = true;
                      dpressed2 = true;
                      dpressed3 = true;
                      dpressed4 = true;
                      dpressed5 = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '2일',
                    style: TextStyle(
                        fontSize: 25,
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
              height: 10,
            ),

            //222222222222222222222222222222222222222222222222222222222222222

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed2
                      ? null
                      : () {
                    if (pressed2) {
                      pressed2 = false;
                      _incrementCountdown2();
                      dpressed = false;
                      dpressed1 = false;
                      dpressed3 = false;
                      dpressed4 = false;
                      dpressed5 = false;
                      dpressed6 = false;
                    } else {
                      pressed2 = true;
                      _incrementCounter2();
                      dpressed1 = true;
                      dpressed = true;
                      dpressed3 = true;
                      dpressed4 = true;
                      dpressed5 = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '3일',
                    style: TextStyle(
                        fontSize: 25,
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
              height: 10,
            ),

            //333333333333333333333333333333333333333333333333333333333333333333333

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed3
                      ? null
                      : () {
                    if (pressed3) {
                      pressed3 = false;
                      _incrementCountdown3();
                      dpressed = false;
                      dpressed1 = false;
                      dpressed2 = false;
                      dpressed4 = false;
                      dpressed5 = false;
                      dpressed6 = false;
                    } else {
                      pressed3 = true;

                      _incrementCounter3();
                      dpressed1 = true;
                      dpressed2 = true;
                      dpressed = true;
                      dpressed4 = true;
                      dpressed5 = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '4일',
                    style: TextStyle(
                        fontSize: 25,
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
              height: 10,
            ),

            //444444444444444444444444444444444444444444444444444444444444444444444

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed4
                      ? null
                      : () {
                    if (pressed4) {
                      pressed4 = false;
                      _incrementCountdown4();
                      dpressed = false;
                      dpressed1 = false;
                      dpressed2 = false;
                      dpressed3 = false;
                      dpressed5 = false;
                      dpressed6 = false;
                    } else {
                      pressed4 = true;

                      _incrementCounter4();
                      dpressed1 = true;
                      dpressed2 = true;
                      dpressed3 = true;
                      dpressed = true;
                      dpressed5 = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '5일',
                    style: TextStyle(
                        fontSize: 25,
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
              height: 15,
            ),
            //5555555555555555555555555555555555555555555555555555555555555555555
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed5
                      ? null
                      : () {
                    if (pressed5) {
                      pressed5 = false;
                      _incrementCountdown5();
                      dpressed = false;
                      dpressed1 = false;
                      dpressed2 = false;
                      dpressed3 = false;
                      dpressed4 = false;
                      dpressed6 = false;
                    } else {
                      pressed5 = true;

                      _incrementCounter5();
                      dpressed1 = true;
                      dpressed2 = true;
                      dpressed3 = true;
                      dpressed4 = true;
                      dpressed = true;
                      dpressed6 = true;
                    }
                  },
                  child: Text(
                    '6일',
                    style: TextStyle(
                        fontSize: 25,
                        color: const Color(0xff444D6A),
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: pressed5
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
                '$_counter5',
                style: TextStyle(fontSize: 30),
              ),
            ]),

            SizedBox(
              height: 15,
            ),
            //666666666666666666666666666666666666666666666666666666666666666666
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              OutlinedButton(
                  onPressed: dpressed6
                      ? null
                      : () {
                    if (pressed6) {
                      pressed6 = false;
                      _incrementCountdown6();
                      dpressed = false;
                      dpressed1 = false;
                      dpressed2 = false;
                      dpressed3 = false;
                      dpressed4 = false;
                      dpressed5 = false;
                    } else {
                      pressed6 = true;

                      _incrementCounter6();
                      dpressed1 = true;
                      dpressed2 = true;
                      dpressed3 = true;
                      dpressed4 = true;
                      dpressed5 = true;
                      dpressed = true;
                    }
                  },
                  child: Text(
                    '7일',
                    style: TextStyle(
                        fontSize: 25,
                        color: const Color(0xff444D6A),
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: pressed6
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
                '$_counter6',
                style: TextStyle(fontSize: 30),
              ),
            ]),

            SizedBox(
              height: 15,
            ),
            //7777777777777777777777777777777777777777777777777777777777777777777
          ],
        ),
      ),
    );
  }
}