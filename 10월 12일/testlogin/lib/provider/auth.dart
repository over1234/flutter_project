import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore users = FirebaseFirestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
late final User? user;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser!
      .authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final userCredential = await _auth.signInWithCredential(credential);

  user = userCredential.user;
  users.collection('Users')
      .doc(user!.uid)
      .set({
    'email': user!.email,
    'uid': user!.uid,
    'username': user!.displayName,
    'PhotoURL': user!.photoURL
  });

  final nickName = user!.displayName;

  Fluttertoast.showToast(
      msg: "환영합니다, $nickName님. 슬기로운 건강생활에 로그인하신걸 환영합니다!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );

  return 'sign in google';
}

Future<String> signInWithFacebook() async {

  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider
      .credential(loginResult.accessToken!.token);

  final authResult = await _auth.signInWithCredential(
      facebookAuthCredential);
  user = authResult.user;
  users.collection('Users')
      .doc(user!.uid)
      .set({
    'email': user!.email,
    'uid': user!.uid,
    'username': user!.displayName,
    'PhotoURL': user!.photoURL,
  });

  final nickName = user!.displayName;

  Fluttertoast.showToast(
      msg: "환영합니다, $nickName님. 슬기로운 건강생활에 로그인하신걸 환영합니다!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );

  return 'sign in facebook';
}

Future<void> firebaseLogOut() async {
  await FacebookAuth.instance.logOut();
  await googleSignIn.signOut();
  await _auth.signOut();
}
