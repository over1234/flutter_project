import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_countdown_timer/index.dart';

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 604800;

class MyCustomGraph extends StatelessWidget {
  const MyCustomGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[

          const SizedBox(
            width: 100,
            height: 30.0,
          ),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(

                    child: Text(
                      "미션 진행현황",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff55CeD6),
                      ),

                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0xff55CeD6),),
                      minimumSize: Size(400, 80),
                    ),
                    onPressed: null
                ),
              ],
            ),
          ),


          const Padding(padding: EdgeInsets.only(left: 100.0),),

          const SizedBox(
            width: 10.0,
            height: 5.0,
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: const [
                SizedBox(
                  width: 15.0,
                  height: 30.0,
                ),
                Text('미션',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color(0xff55CeD6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: const [
                SizedBox(
                  width: 15.0,
                ),
                Text('하루 한시간 조깅',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color(0xff55CeD6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: const [
                SizedBox(
                  width: 15.0,
                ),
                Text('남은 시간',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color(0xff55CeD6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 0,

              child: Row(

                children: [
                  const SizedBox(
                    width: 16.0,
                  ),
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_,  time) {
                      if (time == null) {
                        return Text('시간이 다되었습니다');
                      }
                      return Text(
                        '${time.days}일 ${time.hours}시간 ${time.min}분 ${time.sec}초',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Color(0xff55CeD6),
                        ),
                      );
                    },

                  ),
                ],
              )),
          const SizedBox(
            width: 10.0,
            height: 10.0,
          ),
          Expanded(
            flex: 3,
            child: newMethod(),
          ),
          Expanded(
            flex: 0,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text('1: 박창은',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('2: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('3: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('4: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text('5: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('6: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('7: 정현우',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('8: 우수경',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                )
              ],
            ), ),
        ],
      ),
    );
  }

  Container newMethod() {
    return Container(
      width: 340,
      color: const Color(0xffAEE6EA),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: CustomPaint(
          size: const Size(240, 300),
          foregroundPainter: BarChart(
            data: <double>[150, 155, 199, 150, 300, 500, 120, 1000],
            labels: <String>[
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
            ],
            color: Colors.redAccent,
          ),
        ),
        decoration: const BoxDecoration(
          color: Color(0xffAEE6EA),
          boxShadow: [
            BoxShadow(color: Colors.white, offset: Offset(3.0, 6.0), blurRadius: 15.0),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class BorderedRectangle extends StatelessWidget {
  final Color color;
  final double width;
  final double borderRadius;

  // ignore: use_key_in_widget_constructors
  const BorderedRectangle({
    this.color = Colors.blueAccent,
    this.width = 1.0,
    this.borderRadius = 0,

  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: color,
          width: width,
        ),
      ),
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

  BarChart({required this.data, required this.labels, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size){
    setTextPadding(size);

    List<Offset> coordinates = getCoordinates(size);

    drawBar(canvas, size, coordinates);
    drawXLabels(canvas, size, coordinates);


  }

  @override
  bool shouldRepaint(BarChart oldDelegate) {
    return oldDelegate.data != data;
  }

  void setTextPadding(Size size) {


  }

  void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;


    double barWidthMargin = size.width * 0.09;

    for (int index = 0; index < coordinates.length; index++){
      Offset offset = coordinates[index];
      double left = offset.dx;

      double right = offset.dx + barWidthMargin;
      double top = offset.dy;

      double bottom = size.height - bottomPadding;

      Rect rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawRect(rect, paint);
    }
  }

  void drawXLabels(Canvas canvas, Size size, List<Offset> coordinates){
    double fontSize = calculateFontSize(labels[0], size, xAxis: true);

    for (int index = 0; index < labels.length; index++){
      TextSpan span = TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily:  'Roboto',
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

    double fontSize = (size.width + 40 + numberOfCharacters) / data.length;

    if(xAxis) {
      fontSize *= textScaleFactorXAxis;
    } else {
      fontSize *= textScaleFactorYAxis;
    }
    return fontSize;
  }



  List<Offset> getCoordinates(Size size){
    List<Offset> coordinates = <Offset>[];

    double maxData = data.reduce(max);

    double width = size.width - leftPadding;
    double minBarWidth = width / data.length;

    for(int index = 0; index < data.length; index++) {

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