import 'package:flutter/material.dart';

// 모든 디자인을 이곳에 모아두기로 했다.


// const는 컴파일 전에 값이 정해져있어야하고,
// final은 컴파일 후, 나중에 값이 정해져도 된다.
const kBottomContainerHeight = 80.0; // for bottom container height, when need to modify, not to dig through.
const kActiveCardColour = Color(0xFF1D1E33); // can change color here. : 클릭되었을 때 바뀌는 컬러
const kInactiveCardColour = Color(0xFF111328); // 보통일 때 컬러
const kBottomContainerColour = Color(0xFFEB1555);
// ^^ k 를 붙여서 '이건 상수야' 라는 뜻이다.

// Text의 style을 하드코딩 하지 않기 위해서, (not to do hard coding)
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);