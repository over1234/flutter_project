import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:testlogin/provider/Timer.dart';
import 'package:testlogin/provider/pedometer.dart';
import 'package:testlogin/provider/permission.dart';


void main() {
  runApp(APP());
}

class APP extends StatelessWidget {
  const APP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heal_Me_Lobby',
      debugShowCheckedModeBanner: false,
      home: HealMeApp(),
    );
  }
}

class HealMeApp extends StatefulWidget {
  const HealMeApp({Key? key}) : super(key: key);

  @override
  _HealMeAppState createState() => _HealMeAppState();
}

class _HealMeAppState extends State<HealMeApp> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Container(
              padding: EdgeInsets.only(right: 280.0),
              child: Text('인증하기',
                style: TextStyle(
                  fontSize: 25, color: const Color(0xff55CED6), fontWeight: FontWeight.bold,
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
                      camaraPermission();
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
                        MaterialPageRoute(builder: (context) => TimerPage()),
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
                     Text("스트레칭", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.only(right: 130.0),
                  ),
                  Text("사용 시간", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
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
                        MaterialPageRoute(builder: (context) => Walk()),
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
                      camaraPermission();
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
                  Text("조깅", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.only(right: 145.0),
                  ),
                  Text("식단", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
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
                      camaraPermission();
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
                      camaraPermission();
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
                    Text("식습관", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.only(right: 145.0),
                  ),
                    Text("운동", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
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
                      camaraPermission();
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
                        MaterialPageRoute(builder: (context) => TimerPage()),
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
                    Text("다이어트", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.only(right: 130.0),
                  ),
                   Text("수면 시간", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),  
      ),
    );
  }
}
 


