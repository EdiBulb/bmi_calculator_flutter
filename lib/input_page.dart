import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // 패키지 import
import 'reusable_card.dart';
import 'icon_content.dart';

// It's better to seperate class file with main file.

// const는 컴파일 전에 값이 정해져있어야하고,
// final은 컴파일 후, 나중에 값이 정해져도 된다.
const bottomContainerHeight = 80.0; // for bottom container height, when need to modify, not to dig through.
const activeCardColour = Color(0xFF1D1E33); // can change color here. : 클릭되었을 때 바뀌는 컬러
const inactiveCardColour = Color(0xFF111328); // 보통일 때 컬러
const bottomContainerColour = Color(0xFFEB1555);

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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector( // ReusableCard를 Clickable 하게 만들기 위해서 GestureDetector로 Wrap 함. button으로 안하는 이유: card 스타일을 변경시킴
                    onTap: () { // Tap 되면 setState로 업데이트 시킨다.
                      // colour update.
                      setState(() {
                        selectedGender = Gender.male; // 여기서 값을 준다.
                        // updateColour(Gender.male); // 1: male ==> enum으로 변경함.
                      });

                    } ,
                    child: ReusableCard(
                      // ReusableCard 위젯에 있는 colour, cardChild 프로퍼티를 커스터마이징한다.
                      colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                      // colour: maleCardColour, // 보통일 때 컬러
                      // ReusableCard 위젯 컨텐츠를 customizing 함.
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () { // Tap 되면 setState로 업데이트 시킨다.
                      // colour update.
                      setState(() {
                        selectedGender = Gender.female; // 여기서 값을 준다.
                        // updateColour(Gender.female); // 2: female ==> enum으로 변경함.
                      });

                    } ,
                    child: ReusableCard(
                      // 이래서 변수명 잘 설정하는 게 중요하구나...
                      colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                      // colour: femaleCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0), // only top margin.
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}



