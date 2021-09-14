// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:testlogin/provider/auth.dart';
import 'package:testlogin/provider/loading.dart';
import 'package:transition/transition.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Heal_me_login',
        home: SignInHealMe(),
    );

  }
}


class SignInHealMe extends StatefulWidget {

  const SignInHealMe({Key? key}) : super(key: key);

  @override
  _SignInHealMeState createState() => _SignInHealMeState();
}


class _SignInHealMeState extends State<SignInHealMe> {

  bool login = false;

  @override
  void initState() {
    _auth.authStateChanges().listen((User? user) async {
      if (user != null) {
        setState(() {
          login = true;
        });
        await Navigator.push(
          context,
          Transition(
              child: _profile(),
              transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
        );
      }
      else {
        login = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else {
            if (!snapshot.hasData) {
              return _login();
            }
            else{
              return _profile();
            }
          }
        }
    );
  }

  Widget _login() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 220.0, 0.0, 30.0),
                child: Text('Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.teal[100],
                  ),
                ),
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SignInButton(
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.large,
                          onPressed: () {
                            signInWithGoogle();
                          }
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                      ),
                      SignInButton(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.large,
                          onPressed: ()  {
                            signInWithFacebook();
                          }
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                      ),
                      SignInButton(
                        buttonType: ButtonType.apple,
                        buttonSize: ButtonSize.large,
                        onPressed: () {
                          print('Hi');
                        },
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _profile() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 220.0, 0.0, 0.0),
            ),
            ElevatedButton(
              child: Text('SignOut',
                style: TextStyle(
                    fontSize: 40.0, color: const Color(0xffDCF7F9)),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //모서리를 둥글게
                    borderRadius: BorderRadius.circular(20)),
                primary: const Color(0xffaee6ea),
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                firebaseLogOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
