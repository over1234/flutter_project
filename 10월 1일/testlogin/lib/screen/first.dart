import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter User Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyCustomprofile(),
    );
  }
}

class MyCustomprofile extends StatelessWidget {
  const MyCustomprofile({Key? key}) : super(key: key);

  get text => null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            resizeToAvoidBottomInset : false,
            body: SafeArea(
              child: Column(

                children: [
                  Positioned(
                    child: Stack(
                      children: [
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: Color(0xffDCF7F9),
                                height: 140,
                              ),
                            ],),

                        ),
                        Container(
                          margin: EdgeInsets.all(40),
                          width: 330,
                          height: 125,
                          child: Column(
                            children: [
                              Positioned(
                                child: Stack(
                                  children: [
                                    Container(
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                                        color: const Color(0xff444d6a),),
                                      margin: EdgeInsets.fromLTRB(25, 35, 0, 0),
                                    ),


                                    Container(
                                        child: Text('내가 진짜 정현우',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff444d6a),
                                          ),
                                        ),
                                        margin: EdgeInsets.fromLTRB(100, 37, 0, 0)
                                    ),


                                    Container(
                                      width: 140,
                                      height: 3,
                                      color: Color(0xff444d6a),
                                      margin: EdgeInsets.fromLTRB(100, 68, 0, 0),
                                    ),



                                    Container(
                                      child: Text('이이이이이이이잉',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff444d6a),
                                        ),),
                                      margin: EdgeInsets.fromLTRB(100, 76, 0, 0),
                                    ),

                                    Container(
                                      child: Column(
                                        children: [
                                          Icon(Icons.more_vert)
                                        ],
                                      ),
                                      margin: EdgeInsets.fromLTRB(290, 16, 0, 0),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), //모서리를 둥글게
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 3.0,
                                  offset: Offset(0.0, 0.75)
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 10.0,
                  ),



                  Container(
                    height: 180.0,
                    width: 320.0,
                    color: const Color(0xffe8f8f9),
                    child: ListView(
                      children: [
                        Positioned(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  '참여중인 방',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff444d6a),),),
                                padding: EdgeInsets.fromLTRB(0, 17, 180, 0),
                              ),
                            ],

                          ),
                        ),



                        SizedBox(
                          width: 0,
                          height: 20,
                        ),



                        Container(
                          child: Column(
                            children: [
                              OutlinedButton.icon(
                                onPressed: null,
                                icon:  Icon(Icons.person_search, color: Colors.black, size: 30),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(right: 140),
                                  backgroundColor: Color(0xffffffff),
                                  minimumSize: Size(270, 40),// background// foreground
                                ),
                                label: Text('  정현우',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),


                              SizedBox(
                                width: 0,
                                height: 10,
                              ),



                              Container(
                                child: Column(
                                  children: [
                                    // ignore: deprecated_member_use
                                    OutlinedButton.icon(
                                      onPressed: null,

                                      icon:  Icon(Icons.phone_android, color: Colors.black, size: 30),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.only(right: 140),
                                        backgroundColor: Color(0xffffffff),
                                        minimumSize: Size(270, 40),// background// foreground
                                      ), label: Text('  정현우',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    ),
                                  ],
                                ),
                              ),



                              SizedBox(
                                width: 0,
                                height: 10,
                              ),



                              Container(
                                child: Column(
                                  children: [
                                    // ignore: deprecated_member_use
                                    OutlinedButton.icon(
                                      onPressed: null,

                                      icon:  Icon(Icons.flutter_dash, color: Colors.black, size: 30,),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.only(right: 140),
                                        backgroundColor: Color(0xffffffff),
                                        minimumSize: Size(270, 40),// background// foreground
                                      ), label: Text('  정현우',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),

                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 0,
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    OutlinedButton.icon(
                                      onPressed: null,
                                      icon:  Icon(Icons.surfing, color: Colors.black, size: 30, ),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.only(right: 140),
                                        backgroundColor: Color(0xffffffff),
                                        minimumSize: Size(270, 40),
                                      ), label: Text('  정현우',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),

                                    ),
                                    ),
                                  ],
                                ),
                              ),


                              SizedBox(
                                width: 0,
                                height: 10,
                              ),




                            ],

                          ),

                        ),
                      ],
                    ),

                  ),


                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Container(
                      width: 320,
                      height: 180,

                      color: const Color(0xffe8f8f9),
                      child: Column(
                        children: [
                          Positioned(
                            child: Stack(
                              children: [
                                Container(
                                  child: Text('방 코드 입력',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff54ced6)
                                    ),),
                                  margin: EdgeInsets.fromLTRB(0, 20, 170, 0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Positioned(
                                    child: Stack(
                                      children: [
                                        Container(
                                          color: Color(0xffDCF7F9),
                                          height: 47,
                                          width: 260,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                        ),
                                        Container(
                                          width: 260,
                                          child: Container(
                                            child: TextField(
                                              maxLength: 6,
                                              decoration: InputDecoration(
                                                hintText: ' ex) ABC123',
                                                fillColor: Color(0xffe8f8f9),
                                              ),
                                            ),
                                          ),
                                          margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                        ),
                                      ],
                                    )
                                ),

                                Container(
                                  child: Column(
                                    children: [
                                      // ignore: deprecated_member_use
                                      RaisedButton(onPressed: () {}, child: Icon(Icons.subdirectory_arrow_right, color: Colors.white), color: Color(0xff54ced6),),
                                    ],
                                  ),
                                  margin: EdgeInsets.fromLTRB(170, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}