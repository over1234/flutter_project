import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testlogin/provider/loading.dart';

class MyCustomprofile extends StatelessWidget {
  MyCustomprofile({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser; // 유저 들고오기
  get text => null;
  bool roomIn = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var username = user?.displayName; // 유저 이름
      var photoURL = user?.photoURL; // 유저 프로필 사진
      var email = user?.email.toString(); // 유저 이메일
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          //프로필 흰색 컨테이너 배경(청록색?)
                          color: const Color(0xffDCF7F9),
                          height: 140,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          20, 40, 20, 10), //흰색 컨테이너 위치 조정 왼쪽부터 좌, 상, 우, 하
                      width: 320,
                      height: 140, //흰색 컨테이너 크기 조절
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  //프사
                                  padding:
                                      EdgeInsets.fromLTRB(20, 30, 0.0, 0.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage('$photoURL'),
                                  ),
                                ),
                                Container(
                                    //프로필이름
                                    child: Text(
                                      '$username',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff444d6a),
                                      ),
                                    ),
                                    margin: const EdgeInsets.fromLTRB(
                                        100, 37, 0, 0)),
                                Container(
                                  //프로필이름 아래 작대기
                                  width: 140,
                                  height: 3,
                                  color: const Color(0xff444d6a),
                                  margin:
                                      const EdgeInsets.fromLTRB(100, 68, 0, 0),
                                ),
                                Container(
                                  //상태메시지
                                  child: Text(
                                    '$email',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff444d6a),
                                    ),
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(100, 76, 0, 0),
                                ),
                                Container(
                                  //점 3개
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [const Icon(Icons.more_vert)],
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(290, 10, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), //모서리를 둥글게
                        color: Colors.white,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 3.0,
                              offset: Offset(0.0, 0.75))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '참여중인 방',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff54ced6),
                ),
              ),
              Expanded(
                child: Container(
                  //참여중인 방의 컨테이너가 되는 컨테이너
                  height: 300.0,
                  width: 320.0,
                  color: const Color(0xffe8f8f9),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('PrivateRoom')
                          .snapshots(
                              includeMetadataChanges: true), // 데이터 실시간으로 받기
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          // 만약에 데이터가 없다면
                          return Scaffold(
                            body: Column(),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // 데이터를 받는 중이라면
                          return Loading();
                        }
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            String roomname = data['roomName'];
                            return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(children: [
                                  OutlinedButton.icon(
                                    onPressed: null,
                                    icon: Icon(Icons.person_search,
                                        color: Colors.black, size: 30),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.only(right: 140),
                                      backgroundColor: Color(0xffffffff),
                                      minimumSize: Size(
                                          270, 40), // background// foreground
                                    ),
                                    label: Text(
                                      '$roomname',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ]));
                          }).toList(),
                        );
                      }),
                ),
              ),

              const SizedBox(
                height: 10,
              ), //방코드입력 컨테이너와 참여중인 방 컨테이너 거리 조절 SizedBox

              Expanded(
                //방코드 입력하는 컨테이너
                child: Container(
                  width: 320,
                  height: 200,
                  color: const Color(0xffe8f8f9),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              child: const Text(
                                '방 코드 입력',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff54ced6)),
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 20, 170, 0),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        //방 코드 입력칸
                        children: [
                          Stack(
                            children: [
                              Container(
                                color: const Color(0xffDCF7F9),
                                height: 47,
                                width: 260,
                                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              ),
                              Container(
                                width: 260,
                                child: const TextField(
                                  maxLength: 6,
                                  decoration: InputDecoration(
                                    hintText: ' ex) ABC123',
                                    fillColor: Color(0xffe8f8f9),
                                  ),
                                ),
                                margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              ),
                            ],
                          ),
                          Container(
                            //화살표 버튼(입력버튼)
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                  onPressed: () {},
                                  child: const Icon(
                                      Icons.subdirectory_arrow_right,
                                      color: Colors.white),
                                  color: const Color(0xff54ced6),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(170, 0, 0, 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ), //바닥이랑 방코드 입력 컨테이너 거리
            ],
          ),
        ),
      );
    });
  }
}
