import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';



class Speed extends StatefulWidget {

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  FlutterTts flutterTts = FlutterTts();
  late StreamSubscription<Position> _positionStream;

  double _speed = 0.0;
  double four = 4.0;
  double seven = 7.0;

  Speed() {
    flutterTts.setVolume(1.0);
    flutterTts.setPitch(1.0);
    flutterTts.setLanguage('ko-kr');
    flutterTts.setSpeechRate(0.5);
  }

  @override
  void initState(){
    Speed();
    _positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high)
            .listen((position) {
          _onSpeedChange(position == null ? 0.0 : (position.speed * 18) / 5); //m/s에서 k/h로 변환
        });
    super.initState();
  }

  void _onSpeedChange(double newSpeed) {
    setState(() {
      _speed = newSpeed;
    });
    if(_speed >= 1.0)
      {
        flutterTts.speak('테스트 완료');
      }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
        body: SfRadialGauge(
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
        )
    );
  }
  @override
  void dispose() {
    flutterTts.stop();
    _positionStream.cancel();
    super.dispose();
  }
}
