import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/provider/loading.dart';
import 'package:transition/transition.dart';

import 'game_main_screen.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();

}

class _ScreenState extends State<Screen> {

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return StreamBuilder(
            stream: db.collection('Roomname').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              } else {
                if (!snapshot.hasData) {
                  return _main();
                }
                else{
                  return _game();
                }
              }
            }
        );
      },
    );
  }
}

Widget _main() {
  return Scaffold(
    body: Center(
      child: ListView(
        children: [

        ],
      ),
    ),
  );
}

Widget _game() {
  return Scaffold(
    body: Center(
      child: ListView(
        children: [
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
          Button1(),
          Button2(),
        ],
      ),
    ),
  );
}



class Button1 extends StatelessWidget {
  const Button1({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
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
            color: Colors.black,
            fontFamily: 'Jua',
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffdcf7f9),
        ),
        onPressed: () {
           Navigator.push(
            context,
            Transition(
                child: StartPage(),
                transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
          );
        },
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  Button2({Key? key}) : super(key: key);

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(top: 8.0),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                border: Border.all(color: Colors.white, width: 3)),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text("방제목 : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Jua',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffaee6ea),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      Transition(
                          child: StartPage(),
                          transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                    );
                  },
                ),
              ],
            )
        );
      }
  }