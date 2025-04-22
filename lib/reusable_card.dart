import 'package:flutter/material.dart';
// input_page.dart 에서 seperate 함.


// CustomWidget: Reusable Card
// Refactor -> Extract Widget: Refactoring widget, so no need to repeat codes.
class ReusableCard extends StatelessWidget {
  // const ReusableCard({super.key,}); // what is Key?: tracking but not used here so deleted.

  // Constructor, to difine the color for each card: it will be used to... when you click card, it will change color.
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  // Because this ReusableCard is Stless so it is immutable so all of property need to be immutable
  // That's why use 'final'
  final Color colour; // final makes this property 'immutable'
  final Widget? cardChild; // 카드 속 컨텐츠는 옵션이라서 nullable 타입으로 선언함-> 생성자에 required 없어도 됌.
  final GestureTapCallback? onPress; // 함수를 선언함: 솔직히 이해 잘 안되었음..129.Functions as First Objects 강의임
  // ^^ reusable_card 자체에 click이 되는 함수를 포함시키는 것임. 따라서 디자인과 함수 모두 한 재사용가능한 위젯에 있음
  // ^^ 참고로, Function으로 선언하는 것은 모호해서 디테일하게 선언하는 걸로 Dart 버전 올라가면서 바뀌었다고함. 그래서 GestureTapCallback으로 선언함
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild, // Container 속에 컨텐츠를 child로 표현한다.
        // How to use container?: container has only one child.
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          // to style box.
          borderRadius: BorderRadius.circular(10.0),
          // make box rounded.
          color: colour, // if BoxDecoration, need to put color inside.
        ),
      ),
    );
  }
}
