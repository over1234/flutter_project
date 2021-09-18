import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/screen/motion.dart';

class CameraPicture extends StatefulWidget {
  const CameraPicture({Key? key}) : super(key: key);

  @override
  _CameraPictureState createState() => _CameraPictureState();
}

class _CameraPictureState extends State<CameraPicture> {

    final ImagePicker _picker = ImagePicker();
    XFile? _file;

    takePicture() async {
      final camera = await _picker.pickImage(source: ImageSource.camera);

      setState(() {
        _file = camera;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: _file == null ?
          Text('찍은 사진이 없습니다.',
            style: TextStyle(fontFamily: 'Jua', fontSize: 40,),
          )
              : Image.file(File(_file!.path)),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                takePicture();
              },
              tooltip: 'getCamera',
              backgroundColor: const Color(0xff55CED6),
              child: Icon(Icons.photo_camera),
            ),
            SizedBox(
              width: 270,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UrlHtml()));
              },
              tooltip: '스트레칭 화면 이동',
              backgroundColor: const Color(0xff55CED6),
              child: Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      );
    }
  }


