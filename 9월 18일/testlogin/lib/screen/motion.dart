import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHtml extends StatefulWidget {
  const UrlHtml({Key? key}) : super(key: key);

  @override
  _UrlHtmlState createState() => _UrlHtmlState();
}

class _UrlHtmlState extends State<UrlHtml> {

  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "AI 스트레칭 강사쌤에게",
              style: TextStyle(fontSize: 40, fontFamily: 'Jua', fontWeight: FontWeight.bold),
            ),
            Text(
              "스트레칭 과외 받으러 가기",
              style: TextStyle(fontSize: 39, fontFamily: 'Jua',),
            ),
            Text(
              "↓",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                  _launchInWebView('https://strachingtest.netlify.app/');
              },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(100, 50),
                  side: BorderSide(
                    width: 2.0,
                    color: const Color(0xff55CED6),
                    style: BorderStyle.solid,
                  ),
                ),
              child: Column(
                children: <Widget>[
                  Icon(Icons.link, size: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
