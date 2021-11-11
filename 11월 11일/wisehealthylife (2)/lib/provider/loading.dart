// 위젯 로드시 나타나는 딜레이를 표시하고자 제공하는 provider 화면 입니다.

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: const Color(0xff55CED6),
          child: Center(
            child: SpinKitPianoWave(
              color: const Color(0xffDCF7F9),
              size: 50.0,
            ),
          ),
        );
      },
    );
  }
}