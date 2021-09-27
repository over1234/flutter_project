import 'package:flutter/material.dart';
import 'dart:async';

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timer',
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  var _icon = Icons.play_arrow;
  var _color = Colors.amber;

  Timer? _timer;
  var _time = 0;
  var _isPlaying = false;
  List<String> _saveTimes = [];
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: _body(),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 80,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
              _click();
            }),
            child: Icon(_icon),
            backgroundColor: _color,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _body() {
    var sec = _time ~/ 100;
    var hundredth = '${_time % 100}'.padLeft(2, '0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 450.0),
                    ),
                    Text(
                      '$sec',
                      style: TextStyle(fontSize: 80),
                    ),
                    Text(
                      '.$hundredth',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                FloatingActionButton(
                  child: Icon(Icons.keyboard_return_sharp, color: Colors.black, size: 40,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: const Color(0xffAEE6EA),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _click() {
    _isPlaying = !_isPlaying;

    if(_isPlaying) {
      _icon = Icons.pause;
      _color = Colors.grey;
      _start();
    } else {
      _icon = Icons.play_arrow;
      _color = Colors.amber;
      _pause();
    }
  }
  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
       _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }
}




