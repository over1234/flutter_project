import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {

  ChatModel(this.uploadTime,this.name,this.pk,this.text);
  //구조체처럼 업로드한 시간, 이름, 채팅을 선언해줌
  final int uploadTime;
  final String name;
  final String pk;
  final String text;


  factory ChatModel.fromJson(Map<String, dynamic> json) {
    //FromJson을 쓰는 것을 받아을 경우에 이곳에 구조체를 이용해 하나를 만들어줌
    return ChatModel(json['uploadTime'],json['roomname'],json['person'],json['text']);
  }

  Map<String, dynamic> toJson(){
    //만약 toJson을 받았을 경우
    //앞은 String으로 뒤는 그 page에 맞는 형태를 반환해줌
    return <String, dynamic> {
      'uploadTime' : uploadTime,
      'roomname' : name,
      'pk' : pk,
      'Text' : text,
    };
  }
}