import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wisehealthylife/provider/ChatModel.dart';
import 'package:wisehealthylife/provider/Chatprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class Chatmessage extends StatelessWidget {
  const Chatmessage({Key? key, required this.chatModel}) : super(key: key);
  //Chatmessage를 선언 할 때 chatModel을 같이 선언해 전역변수처럼 사용함
  final ChatModel chatModel;
  get cart_prod_qty => null;
  //채팅 내용의 여부를 확인하는 함수
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<Chatprovider>(context);
    //p라는 함수로 provider과 연결함
    var isMe = chatModel.pk == p.pk;
    //지금 들어온 채팅이 나인지 확인하는 변수

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        //만약 지금 들어온 채팅이 나라면 이름을 오른쪽(내 채팅), 아니면 왼쪽(남의 채팅)으로 설정함
        children: [
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            //들어온 채팅이 나라면 채팅 내용을 오른쪽, 아니면 왼쪽으로 설정해줌.
            children: [
              Padding(
                //채팅의 크기를 설정해줌
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  chatModel.name,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                //채팅 뒤에 있는 말풍선 설정
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                    color: isMe ? Colors.lightBlue[200] : Colors.lightBlue[400],
                    //만약 나라면 색을 좀 더 연하게, 내가 아니라면 좀 더 진하게 해줌
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(isMe ? 30 : 0),
                        //만약 내가 아니라면 왼 아래를 뾰족하게 함
                        bottomRight: Radius.circular(isMe ? 0 : 30))),
                //만약 나라면 오른쪽 아래를 뾰족하게 함
                child: Text(
                  chatModel.text != null ? chatModel.text : 'Null',
                  //만약 채팅이 null이 아니라면 채팅을 내보내고, 아니라면 오류 메세지 'Null'을 띄움
                  //cart_prod_qty?? chatModel.text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
