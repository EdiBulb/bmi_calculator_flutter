import 'package:flutter/material.dart';

// Flutter는 오픈소스이기 때문에 만들어진 위젯에 의지할 필요 없다. 내가 새로 만들면 된다.
// Package가 만들어지는 원리도 마찬가지다. 사람들이 오픈소스를 가지고 customizing 해서 만들어진 것이다.
// 플러터의 위젯에 의지할 필요 없다. 절대로!!!
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData? icon;
  final VoidCallback
  onPressed; // 이게 강의에서는 Function으로 선언하는데, VoidCallBack으로 바뀌었다.

  // challenge

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // RawMaterialButton 파일 보고 가져옴
      child: Icon(icon),
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
