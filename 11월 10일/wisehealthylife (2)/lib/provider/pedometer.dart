//만보기 화면입니다. 현재 release 버젼에서도 동작하고 있지 않습니다

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Walk extends StatefulWidget {
  @override
  _WalkState createState() => _WalkState();
}

class _WalkState extends State<Walk> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '자, 우리 앞으로 걸어보자고요!';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '당신의 걸음걸이 : ',
                    style: TextStyle(fontSize: 30, fontFamily: 'Jua',),
                  ),
                  Text(
                    _steps,
                    style: TextStyle(fontSize: 60, color: const Color(0xffFF5C7A)),
                  ),
                  Divider(
                    height: 50,
                    thickness: 0,
                    color: Colors.white,
                  ),
                  Text(
                    'Pedestrian status:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
                  ),
                  Icon(
                    _status == 'walking'
                        ? Icons.directions_walk
                        : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                    size: 100,
                  ),
                  Center(
                    child: Text(
                      _status,
                      style: _status == 'walking' || _status == 'stopped'
                          ? TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu')
                          : TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffAEE6EA),
                      minimumSize: Size(100, 50),// background// foreground
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("돌아가기", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Jua'),),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}