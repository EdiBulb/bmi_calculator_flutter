import 'package:flutter/material.dart';
// input_page.dart에서 seperate함.

// Text의 style을 하드코딩 하지 않기 위해서, (not to do hard coding)
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

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
          style: labelTextStyle, // much simple
        )
      ],
    );
  }
}