import 'package:flutter/material.dart';
// It's better to seperate class file with main file.

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
                    colour: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CustomWidget: Reusable Card
// Refactor -> Extract Widget: Refactoring widget, so no need to repeat codes.
class ReusableCard extends StatelessWidget {
  // const ReusableCard({super.key,}); // what is Key?: tracking but not used here so deleted.

  // Constructor, to difine the color for each card: it will be used to... when you click card, it will change color.
  ReusableCard({required this.colour});

  final Color colour; // final makes this property 'immutable'

  @override
  Widget build(BuildContext context) {
    return Container(
      // How to use container?: container has only one child.
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // to style box.
        borderRadius: BorderRadius.circular(10.0),
        // make box rounded.
        color: colour, // if BoxDecoration, need to put color inside.
      ),
    );
  }
}
