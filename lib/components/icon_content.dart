import 'package:flutter/material.dart';

import '../constants.dart';
// input_page.dart에서 seperate함.



// 코드가 반복 되어서: Refactor -> Extract Widget: Refactoring widget, so no need to repeat codes.
class IconContent extends StatelessWidget {

  // 커서를 갖다대면, Data Type을 알 수 있다.
  final IconData icon; // 아이콘을 커스터마이징 할 수 있도록
  final String label; // 텍스트를 커스터마이징 할 수 있도록

  IconContent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Column 중앙 정렬
      children: <Widget>[
        Icon(
          icon, // Male icon
          size: 80.0,
        ),
        SizedBox(height: 15.0,), // 간격
        Text(
          label, // 텍스트
          style: kLabelTextStyle, // much simple
        )
      ],
    );
  }
}