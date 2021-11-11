import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

class light extends StatefulWidget {
  const light({Key? key}) : super(key: key);

  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<light> {
  bool pressed = true; //버튼 눌렀을때를 표현
  int score = 0; // 점수를 추가해주는것
  String _luxString = '인증하기를 누르세요'; //pressed가 false일때 현재 밝기 옆에 출력해주는 문장
  late Light _light; // light 값이 들어간건 "pub.dev에서 가져온 코드 수정"
  late StreamSubscription _subscription;
  int luxValue = 0;
  get onSelectNotification => null;
  void onData(luxValue) async {
    //print("Lux value: $luxValue");
    setState(() {
      //만약에 버튼이 눌리지 않았다면 true
      if (pressed == true) {
        _luxString = "$luxValue";
        if (luxValue > 50) {
          _showdanger();
        } else {
          counter();
        }
      }
    });
  }

// 점수 올려주기, 게임이 시작됬을때 실행
  void counter() {
    if (pressed == true) {
      setState(() {
        score = score + 1;
      });
    }
  }

  //게임 시작됬을때 실행
  void stopListening() {
    if (pressed == true) {
      _subscription.cancel();
    }
  }

  //게임 시작됬을때 실행
  void startListening() {
    if (pressed == true) {
      _light = Light();
      try {
        _subscription = _light.lightSensorStream.listen(onData);
      } on LightException catch (exception) {
        // ignore: avoid_print
        print(exception);
      }
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var _flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    initPlatformState();
  }

  // ignore: non_constant_identifier_names
  Future NotificationEvent(String payload) async {
    // ignore: avoid_print
    print("payload : $payload");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('알람뜸'),
          content: Text('Payload: $payload'),
        ));
  }

  //경고 메세지
  Future _showdanger() async {
    var android = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);

    var ios = const IOSNotificationDetails();
    var detail = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
      0,
      '경고',
      '어두운화면에서 폰을 보고있습니다',
      detail,
      payload: 'Hello Flutter',
    );
  }

  //게임 시작됬다는 알림
  Future _showstart() async {
    var android = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);

    var ios = const IOSNotificationDetails();
    var detail = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
      0,
      '시작!',
      '게임이 시작되었습니다',
      detail,
      payload: 'Hello Flutter',
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('현재 실내 밝기'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(250, 10, 0, 0),
                // 버튼 삼항연산자, 만약에 버튼이 눌렸다면 pressed를 false로 만들고 알람뜨게해주기, 그럼 다음 버튼 누를때는 알람이 아닌 toast메세지
                child: OutlinedButton(
                  onPressed: pressed
                      ? () {
                    pressed = false;
                    _showstart();
                  }
                      : () {
                    Fluttertoast.showToast(
                      // toast 메시지
                        msg: "게임이 이미 진행중입니다!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: const Text('인증하기'),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Text(
                '현재밝기: $_luxString\n',
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                '$score',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}