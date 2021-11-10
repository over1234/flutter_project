import 'package:flutter/material.dart';
import 'package:wisehealthylife/screen/first.dart';
import 'package:wisehealthylife/screen/Setting.dart';
import 'package:wisehealthylife/screen/list.dart';
import 'makeroom.dart';

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List _widgetOptions = <Widget>[MyCustomprofile(), ResultScreen(), Entpage(),Setting()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar( // footer 제작
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem( // 프로필 화면
                  icon: Icon(Icons.home),
                  label: '프로필'
              ),
              BottomNavigationBarItem( // 사설방 리스트
                  icon: Icon(Icons.groups),
                  label: '전체 사설방'
              ),
              BottomNavigationBarItem( // 방 만들기
                  icon: Icon(Icons.add_circle),
                  label: '방 만들기'
              ),
              BottomNavigationBarItem( // 설정(미개발)
                  icon: Icon(Icons.settings),
                  label: '설정'
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.black12,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}