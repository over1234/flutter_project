// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:testlogin/provider/loading.dart';
import 'package:transition/transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

final DateTime timestamp = DateTime.now();
final GoogleSignIn googleSignIn = GoogleSignIn();
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
                            /*await Navigator.push(
                              context,
                              Transition(
                                  child: _profile(),
                                  transitionEffect: TransitionEffect
                                      .LEFT_TO_RIGHT),
                            );*/
                          }
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                      ),
                      SignInButton(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.large,
                          onPressed: () {
                            signInWithFacebook();
                            /* await Navigator.push(
                              context,
                              Transition(
                                  child: _profile(),
                                  transitionEffect: TransitionEffect
                                      .RIGHT_TO_LEFT),
                            );*/
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

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!
          .authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      print(user);


      final nickName = user?.displayName;

      final FirebaseFirestore _user = FirebaseFirestore.instance;
      _user.collection('User')
          .doc('google_user')
          .set({
        'email': user?.email,
        'username': user?.displayName,
        'PhotoURL': user?.photoURL,
        'timestamp': timestamp,
      });

      Fluttertoast.showToast(
          msg: "환영합니다, $nickName님. 슬기로운 건강생활에 로그인하신걸 환영합니다!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } catch (error) {
      print(error);
    }

    return '구글 로그인에 성공하셨습니다.';
  }


  Future<String> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);

      final authResult = await _auth.signInWithCredential(
          facebookAuthCredential);
      final User? user = authResult.user;
      print(user);

      final nickName = user?.displayName;

      final FirebaseFirestore _user = FirebaseFirestore.instance;
      _user.collection('User')
          .doc('facebook_user')
          .set({
        'email': user?.email,
        'username': user?.displayName,
        'PhotoURL': user?.photoURL,
        'timestamp': timestamp,
      });

      Fluttertoast.showToast(
          msg: "환영합니다, $nickName님. 슬기로운 건강생활에 로그인하신걸 환영합니다!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } catch (e) {
      print(e);
    }

    return '페이스북 로그인에 성공하셨습니다.';
  }

  Future<void> firebaseLogOut() async {
    await FacebookAuth.instance.logOut();
    await googleSignIn.signOut();
    await _auth.signOut();
  }

}
