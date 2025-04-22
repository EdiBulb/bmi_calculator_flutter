import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // 패키지 import
import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

// It's better to seperate class file with main file.



// enum can't be declared inside class.
// why use enum?: if I set male is equal 1, female is equal 2, it is confusing to understand.
// enum은 option이 2개 이상일 때, 쓰면 좋다. 직관적으로 0,1 대신에, 코드를 읽고 이해하기 쉽게 만든다.
// if need comments, it is not good code. 주석이 필요하면, 좋은 코드가 아니다.
enum Gender { // for enum, it starts with Capital letter.
  male,
  female,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180; // 이건 계속 바뀌는 값이라서 const가 될 수 없다.

  // This value is changeable so not 'final'
  // Color maleCardColour = inactiveCardColour;   // Starting value
  // Color femaleCardColour = inactiveCardColour;  // Starting value

  // to remove IF-ELSE, use this selectedGender.
  Gender? selectedGender;

  // method for changing color in card.
  // 1 = male, 2 = female ==> enum으로 변경함.
  // void updateColour(Gender selectedGender) {
  //
  //   // 항상 우리의 목표는 코드 자체를 보고 이해하기 쉽게 만들고, 코드의 양을 줄이는 것이다.
  //   // 그래서 if else 대신 Ternary Operator를 씀, 그리고 변수명이 너무 중요하다.
  //   // when male card pressed.
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour; // maleCard -> actice
  //       femaleCardColour = inactiveCardColour; // femaleCard -> inactive.
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   // when female card pressed.
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColour; // femaleCard -> active
  //       maleCardColour = inactiveCardColour; // maleCard -> inactive.
  //     } else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // ReusableCard 위젯에 있는 colour, cardChild 프로퍼티를 커스터마이징한다.
                    colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                    // colour: maleCardColour, // 보통일 때 컬러
                    // ReusableCard 위젯 컨텐츠를 customizing 함.
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // 이래서 변수명 잘 설정하는 게 중요하구나...
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    // colour: femaleCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('HEIGHT', style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline, // 밑줄 맞춤 정렬
                  textBaseline: TextBaseline.alphabetic, // 밑줄 맞춤 정렬
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle, // constants.dart 에서 만듬
                    ),
                    Text('cm',
                    style: kLabelTextStyle,),
                  ],
                ),
                  Slider( // 항상 ctrl + q 를 누르면 자세히 보기가 나오니까, 그걸 참고해서 값을 넣자
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555), // 참고로, 디테일한 설명은 Flutter Doc를 참고해야한다.
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();

                        });

                      })
                ],// 같은 폰트로
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0), // only top margin.
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}



