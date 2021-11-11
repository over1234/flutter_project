import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ChatModel.dart';

class Chatprovider extends ChangeNotifier {

  static const String CHATROOM = 'CHATROOM';
  //CHATROOM이란 명령어를 정적으로 선언해줘 바뀌지 않게 함
  Chatprovider(this.pk, this.name);
  //구조체처럼 이름과 한 말을 만듦.
  final String pk;
  final String name;

  var ChatList = <ChatModel>[];
  //ChatModel을 Chatlist로 선언해줌

  Stream<QuerySnapshot> getSnapshot(){
    //firebase에 올릴 때 현재 시각보다 뒤에 보내는지 확인하는 함수
    final f = FirebaseFirestore.instance;
    return f.collection(CHATROOM).limit(1).orderBy('uploadTime', descending: true).snapshots();
  }

  Future load() async{
    //firebase에 올릴 때 사용하는 함수
    var now = DateTime.now().microsecondsSinceEpoch;
    //현재 시각을 micro초까지 계산하게 함
    final f = FirebaseFirestore.instance;
    var result = await f.collection(CHATROOM).where('uploadTime', isGreaterThan: now).orderBy('uploadTime', descending:true).get();
    //만약 보내는 시간이 현재보다 더 뒤라면 보냄
    var l = result.docs.map((e) => ChatModel.fromJson(e.data())).toList();
    notifyListeners();
    //그리고 특정 메소드를 변경이 되니 이것을 provider에게 알려줌
    ChatList.addAll(l);

  }
  Future send(String text) async{
    //현재 보여줘야 될 채팅을 보내주는 함수
    var now = DateTime.now().millisecondsSinceEpoch;
    final f = FirebaseFirestore.instance;
    await f.collection(CHATROOM).doc(now.toString()).set(ChatModel(now, name, pk, text).toJson());
    //firebase에 ChatModel의 형식으로 보내는 코드
  }

  void addOne(ChatModel chatModel) {
    //함수를 초기화하고, 그것을 provider에게 알려줌
    ChatList.insert(0, chatModel);
    notifyListeners();
  }
}
