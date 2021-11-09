import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Speed extends StatefulWidget {

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  Timer? _timer;
  var _time = 0.0;
  final FlutterTts flutterTts = FlutterTts();
  late StreamSubscription<Position> _positionStream;

  double _speed = 0.0; // 스피드
  double four = 4.0; // 4분 주기
  double seven = 7.0; // 7분 주기

  speek() async{ // tts를 활용하여서 뛰면서 들을 수 있도록
    flutterTts.setVolume(1.0);
    flutterTts.setPitch(1.0);
    flutterTts.setLanguage('ko-kr');
    flutterTts.setSpeechRate(0.5);
    flutterTts.speak('더 분발해주세요.');
  }

  void _start() { // 시작하면... 시간이 흐르도록
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  @override
  void initState(){ // GPS로 속도 측정
    _start();
    _positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high)
            .listen((position) {
          _onSpeedChange(position == null ? 0.0 : position.speed);
        });
    super.initState();
  }

  void _onSpeedChange(double newSpeed) { // 주기를 나눈 것.
    if(_time <= 60 || _time > 240 && _time <= 300 || _time > 480 && _time <= 540 || _time > 720 && _time <= 780 || _time > 960 && _time <= 1020 || _time > 1200 && _time <= 1260) {
      if(newSpeed >= 2.0 && newSpeed < four)
      {
        speek();
      }
    }
    else
    {
      if(newSpeed >= four && newSpeed < seven)
      {
        speek();
      }
    }
    setState(() {
      _speed = newSpeed;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold( // 속도계 UI 구성
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(startAngle: 0,
                      endAngle: 0,
                      minimum: 0,
                      maximum: 80,
                      interval: 10,
                      radiusFactor: 0.4,
                      showAxisLine: false,
                      showLastLabel: false,
                      minorTicksPerInterval: 4,
                      majorTickStyle: MajorTickStyle(
                          length: 8, thickness: 3, color: Colors.white),
                      minorTickStyle: MinorTickStyle(
                          length: 3, thickness: 1.5, color: Colors.grey),
                      axisLabelStyle: GaugeTextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    RadialAxis(minimum: 0,
                        maximum: 30,
                        labelOffset: 30,
                        axisLineStyle: AxisLineStyle(
                            thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                        majorTickStyle: MajorTickStyle(
                            length: 6, thickness: 4, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 3, color: Colors.white),
                        axisLabelStyle: GaugeTextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        ranges: <GaugeRange>[
                          GaugeRange(startValue: 0,
                              endValue: 30,
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.03,
                              endWidth: 0.03,
                              gradient: SweepGradient(
                                  colors: const<Color>[
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.red
                                  ],
                                  stops: const<double>[0.0, 0.5, 1]))
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: _speed,
                              needleLength: 0.95,
                              enableAnimation: true,
                              animationType: AnimationType.ease,
                              needleStartWidth: 1.5,
                              needleEndWidth: 6,
                              needleColor: Colors.red,
                              knobStyle: KnobStyle(knobRadius: 0.09,sizeUnit: GaugeSizeUnit.factor))
                        ], annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text('${_speed.toStringAsFixed(1)}',
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))),
                              angle: 90,
                              positionFactor: 0.5)
                        ]
                    )
                  ]
              ),
            ],
          ),
        )
    );
  }
  @override
  void dispose() {
    flutterTts.stop();
    _positionStream.cancel();
    _timer?.cancel();
    super.dispose();
  }
}