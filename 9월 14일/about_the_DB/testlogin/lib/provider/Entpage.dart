import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testlogin/screen/chat_main.dart';
import 'package:uuid/uuid.dart';


class Entpage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var u = Uuid().v1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('방 만들기'),
        centerTitle:true,
        elevation: 0.0,

        actions: <Widget> [

          IconButton (
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked.');

            },
          )
        ],
        backgroundColor: const Color(0xff55ced6),
      ),
      body: Builder (
        builder: (context) {
          return GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();


            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(

                  ),
                  Form(
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.teal,
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 16.0
                                )
                            )
                        ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                autofocus: true,
                                controller: controller,
                                decoration: InputDecoration(
                                    labelText: '방 이름'
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),

                              SizedBox(
                                height: 40.0,
                              ),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  color: Color(0xffAEE6EA),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    if(controller.text != '' ) {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> ThirdPage()));
                                      final f = FirebaseFirestore.instance;
                                      await f.collection('RoomName').doc('name').set({'name?':'name'});
                                      print('방 이름이 설정되었습니다.');
                                    } else {
                                      showSnackBar(context);
                                    }

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),

    );

  }
}

void showSnackBar(BuildContext context) {
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('틀린 정보가 있습니다. 다시 확인해주세요',
        textAlign: TextAlign.center,
      ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,

      )
  );
}