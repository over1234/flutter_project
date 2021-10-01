// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:testlogin/screen/lobi.dart';
import 'package:testlogin/provider/auth.dart';
import 'package:testlogin/provider/loading.dart';

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          else {
            if (!snapshot.hasData) {
              return _login();
            }
            else{
              return Lobby();
            }
          }
        }
    );
  }

  Widget _login() {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffAEE6EA),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffAEE6EA),
        body: Container(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Container(
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xffAEE6EA),
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    radius: 60,
                                    child: Image.asset("images/Logo.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffAEE6EA),
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65,
                                  ),
                                  SignInButton(
                                      buttonType: ButtonType.google,
                                      buttonSize: ButtonSize.large, // small(default), medium, large
                                      onPressed: () {
                                        signInWithGoogle();
                                      }),
                                  SizedBox(height: 20),
                                  SignInButton(
                                      buttonType: ButtonType.facebook,
                                      buttonSize: ButtonSize.large,
                                      width: 261,// small(default), medium, large
                                      onPressed: () {
                                        signInWithFacebook();
                                      }),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "클릭 한 번으로",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jua',
                                    ),
                                  ),
                                  Text(
                                    "슬기로운 건강생활을 즐겨보세요.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jua',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
