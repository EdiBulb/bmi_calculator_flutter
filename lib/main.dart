import 'package:flutter/material.dart';
import 'screens/input_page.dart'; // import

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // dark() is default, and copyWith -> customizing.
        primaryColor: Color(0xFF0A0E21),
        // Customizing: 0xFF added, PrimaryColor
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      // first screen.
      home: InputPage(), // import 'input_page.dart' to access InputPage()
    );
  }
}
