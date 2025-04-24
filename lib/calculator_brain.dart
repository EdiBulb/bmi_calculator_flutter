import 'dart:math';
// Functionality file.
class CalculatorBrain {

  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi=0; // 다른 클래스에서 접근 불가

  String calculatedBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1); // 소수점 1자리 수
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}