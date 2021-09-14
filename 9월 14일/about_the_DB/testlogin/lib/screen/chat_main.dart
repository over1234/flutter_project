
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/provider/Entpage.dart';

import 'chatting.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Firstpage(),

    );
  }
}

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('로비 화면'),
        centerTitle:true,
        elevation: 0.0,

        actions: <Widget> [

          IconButton (
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked.');
            },
          )
        ],
        backgroundColor: const Color(0xff55ced6),
      ),
      body: Builder(builder: (BuildContext ctx) {
        return Center(
          child: ElevatedButton(
            child: Text('방 만들기',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FourthPage()
              ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffAEE6EA),
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      },
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('asset/bbanto.png'),
                backgroundColor: Colors.white,
              ),

              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/chef.png'),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/chef.png'),
                  backgroundColor: Colors.white,
                ),
              ],

              accountName: Text('Yeah'),
              accountEmail: Text('myemail@gmail.com'),
              onDetailsPressed: (){
                print('arrow is clicked');
              },

              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )
              ),
            ),

            ListTile(
              leading: Icon(Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: (){
                print('Home button is clicked');
              },
              trailing: Icon(Icons.add),
            ),

            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: (){
                print('Setting button is clicked');
              },
              trailing: Icon(Icons.add),
            ),

            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: (){
                print('Q&A button is clicked');

              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),

      ),
    );

  }
}

class FourthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Entpage();

  }
}

class ThirdPage extends StatefulWidget {


  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();

  List<String> _Chats = [];

  @override
  void initState() {

  }
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar (

          title: Text('채팅 방',
            style: TextStyle(
              color: const Color(0xff55ced6),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // iconTheme: IconThemeData(
          //   color: const Color(0xff55ced6),
          // ),
          actions: <Widget> [
            ButtonTheme(
              // ignore: deprecated_member_use
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12, right: 8.0),
                child: Container(
                  width: 74.0,
                  height: 8.0,
                  child: ElevatedButton(
                    child: Text("나가기",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff55CED6), // background
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> Firstpage()));
                    },
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        drawer: Container(
          width: 200,
          child: Center(
            child: Drawer(
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  color: const Color(0xffDCF7F9),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "ROOM MAIN",
                            style: TextStyle(
                                fontSize: 30,
                                color: const Color(0xff55CED6),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 170,
                            height: 5,
                            color: const Color(0xff55CED6),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {

                            },
                            child: Text(
                              "초대하기",
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff55CED6),

                              ),
                            ),
                          ),
                          ListTile(
                            //
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: AnimatedList(
                reverse: true,
                key: _animListKey,
                itemBuilder: _buildItem,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(hintText: "메세지 입력창",
                        hintStyle: TextStyle(
                          color: const Color(0xff55ced6),
                        ),
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                    child: Text("Send"),
                    color: const Color(0xffAEE6EA),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _buildItem(context, index, animation)  {
    return Chatmessage(_Chats[index], animation:animation, );
  }


  void _handleSubmitted(String text) {
    _textEditingController.clear();
    _Chats.insert(0, text);
    _animListKey.currentState!.insertItem(0);
  }
}