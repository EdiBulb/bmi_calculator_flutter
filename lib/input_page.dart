import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // 패키지 import
import 'reusable_card.dart';
import 'icon_content.dart';

// It's better to seperate class file with main file.

// const는 컴파일 전에 값이 정해져있어야하고,
// final은 컴파일 후, 나중에 값이 정해져도 된다.
const bottomContainerHeight = 80.0; // for bottom container height, when need to modify, not to dig through.
const activeCardColour = Color(0xFF1D1E33); // can change color here.
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(
                    // ReusableCard 위젯에 있는 colour, cardChild 프로퍼티를 커스터마이징한다.
                    colour: activeCardColour,
                    // ReusableCard 위젯 컨텐츠를 customizing 함.
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,

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



