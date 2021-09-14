import 'package:flutter/material.dart';

import 'game_main_screen.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();

}

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button1(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Button2(),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}


class Button1 extends StatelessWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
          border: Border.all(color: Colors.white, width: 3)),
      child: ElevatedButton(
        child: Text("방제목 :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffdcf7f9),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => StartPage(),
            ),
          );
        },
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
          border: Border.all(color: Colors.white, width: 3)),
      child: ElevatedButton(
        child: Text("방제목 : ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
              color: Colors.black
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffaee6ea),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => StartPage(),
            ),
          );
        },
      ),
    );
  }
}