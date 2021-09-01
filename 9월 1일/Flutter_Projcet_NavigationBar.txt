import 'package:flutter/material.dart';
import 'package:testlogin/screen/first.dart';
import 'package:testlogin/screen/second.dart';
import 'package:testlogin/screen/Setting.dart';
import 'package:testlogin/screen/Peopole.dart';
import 'package:testlogin/screen/list.dart';


void main() {
  runApp(APP());
}

class APP extends StatelessWidget {
  const APP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heal_Me_Lobby',
      debugShowCheckedModeBanner: false,
      home: Lobby(),
    );
  }
}

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List _widgetOptions = <Widget>[Screen(), First(), Second(),Setting(), People()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
              label: 'groups'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
              label: 'person'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
              label: 'circle'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
              label: 'settings'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.black12,
        onTap: _onItemTapped,
      ),
    );
  }
}









