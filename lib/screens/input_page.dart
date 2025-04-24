import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // 패키지 import

import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/buttom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

// It's better to seperate class file with main file.

// enum can't be declared inside class.
// why use enum?: if I set male is equal 1, female is equal 2, it is confusing to understand.
// enum은 option이 2개 이상일 때, 쓰면 좋다. 직관적으로 0,1 대신에, 코드를 읽고 이해하기 쉽게 만든다.
// if need comments, it is not good code. 주석이 필요하면, 좋은 코드가 아니다.
enum Gender {
  // for enum, it starts with Capital letter.
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180; // 이건 계속 바뀌는 값이라서 const가 될 수 없다.
  int weight = 60;
  int age = 20;

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
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // ReusableCard 위젯에 있는 colour, cardChild 프로퍼티를 커스터마이징한다.
                    colour:
                        selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                    // colour: maleCardColour, // 보통일 때 컬러
                    // ReusableCard 위젯 컨텐츠를 customizing 함.
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // 이래서 변수명 잘 설정하는 게 중요하구나...
                    colour:
                        selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                    // colour: femaleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
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
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline, // 밑줄 맞춤 정렬
                    textBaseline: TextBaseline.alphabetic, // 밑줄 맞춤 정렬
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle, // constants.dart 에서 만듬
                      ),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    // Slider의 스타일만 모아둠,
                    data: SliderTheme.of(context).copyWith(
                      // of와 copyWith로 customizing
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      // 크기 커지게 함
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ), // 오버레이 적용
                    ),
                    child: Slider(
                      // 항상 ctrl + q 를 누르면 자세히 보기가 나오니까, 그걸 참고해서 값을 넣자
                      // 참고로, 디테일한 설명은 Flutter Doc를 참고해야한다.
                      // 실제 Slider의 기능들은 여기에 모아둠
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ], // 같은 폰트로
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                print("minus button clicked");
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                print("plus button clicked");

                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                print("minus button clicked");
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                print("plus button clicked");
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {

              // 계산
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              // 값 넘기기
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculatedBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}



