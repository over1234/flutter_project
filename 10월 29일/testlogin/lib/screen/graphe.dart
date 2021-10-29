import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 파베
  await Firebase.initializeApp(); // 접속
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCustomGraph(),
    );
  }
}

class MyCustomGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('custom graph'),
      ),
      body: StreamBuilder(
          //Streambuilder를 이용하여 파이어베이스에서 스트림의 최신값을 자동으로 가져와 자동으로 UI를 업데이트 함
          stream: FirebaseFirestore.instance
              .collection('그래프')
              .snapshots(includeMetadataChanges: true),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Scaffold(
                body: Center(),
              );
            }
            return ListView(
              //리스트뷰
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomPaint(
                      size: Size(300, 300),
                      foregroundPainter: BarChart(
                        //그래프 파이어베이스에서 값을 받아와서 반영하여 막대그래프의 수치로 표현해야하나 아직 받아오고나서 표현하는것이 제대로 구현 안됨
                        data: <double>[
                          105,
                          55,
                          99,
                          150,
                          300,
                          500,
                          120,
                          1000,
                        ],
                        labels: <String>[
                          '1', //1번 그래프
                          '2', //2번
                          '3', //3번
                          '4', //4번
                          '5', //5번
                          '6', //6번
                          '7', //7번
                          '8', //8번
                        ],
                        color: Colors.redAccent, //막대의 색
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}

class BarChart extends CustomPainter {
  final Color color;
  final List<double> data;
  final List<String> labels;
  double bottomPadding = 0.0;
  double leftPadding = 0.0;
  double textScaleFactorXAxis = 1.0;
  double textScaleFactorYAxis = 1.2;

  BarChart(
      {required this.data, required this.labels, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    setTextPadding(size);

    List<Offset> coordinates = getCoordinates(size);

    drawBar(canvas, size, coordinates);
    drawXLabels(canvas, size, coordinates);
  }

  @override
  bool shouldRepaint(BarChart oldDelegate) {
    return oldDelegate.data != data;
  }

  void setTextPadding(Size size) {}

  void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
    //막대그래프 넓이위치설정
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    double barWidthMargin = size.width * 0.09;

    for (int index = 0; index < coordinates.length; index++) {
      Offset offset = coordinates[index];
      double left = offset.dx;

      double right = offset.dx + barWidthMargin;
      double top = offset.dy;

      double bottom = size.height - bottomPadding;

      Rect rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawRect(rect, paint);
    }
  }

  void drawXLabels(Canvas canvas, Size size, List<Offset> coordinates) {
    double fontSize = calculateFontSize(labels[0], size, xAxis: true);

    for (int index = 0; index < labels.length; index++) {
      TextSpan span = TextSpan(
        //막대 그래프 안 숫자의 크기, 색깔 등,,,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        text: labels[index],
      );
      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();

      Offset offset = coordinates[index];
      double dx = offset.dx;
      double dy = size.height - tp.height;

      tp.paint(canvas, Offset(dx, dy));
    }
  }

  double calculateFontSize(String value, Size size, {required bool xAxis}) {
    int numberOfCharacters = value.length;

    double fontSize = (size.width / numberOfCharacters) / data.length;

    if (xAxis) {
      fontSize *= textScaleFactorXAxis;
    } else {
      fontSize *= textScaleFactorYAxis;
    }
    return fontSize;
  }

  void drawYText(Canvas canvas, String text, double fontSize, double y) {
    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
      ),
      text: text,
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);

    tp.layout();

    Offset offset = Offset(0.0, y);
    tp.paint(canvas, offset);
  }

  List<Offset> getCoordinates(Size size) {
    List<Offset> coordinates = <Offset>[];

    double maxData = data.reduce(max);

    double width = size.width - leftPadding;
    double minBarWidth = width / data.length;

    for (int index = 0; index < data.length; index++) {
      double left = minBarWidth * (index) + leftPadding;

      double normalized = data[index] / maxData;

      double height = size.height - bottomPadding;

      double top = height - normalized * height;

      Offset offset = Offset(left, top);
      coordinates.add(offset);
    }
    return coordinates;
  }
}
