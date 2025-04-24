import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final GestureTapCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        // only top margin.
        // padding: EdgeInsets.only(bottom: 20.0), it's better not to have in android.
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
      ),
    );
  }
}