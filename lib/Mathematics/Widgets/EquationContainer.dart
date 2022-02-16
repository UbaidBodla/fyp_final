//Equation Container: display the equation of numbers.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquationContainer extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final int number1;
  final int number2;
  final String sign;
  final Color backColor;

  const EquationContainer(
      {Key key,
      this.screenHeight,
      this.screenWidth,
      this.number1,
      this.number2,
      this.sign,
      this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 8,
      width: screenWidth * 60,
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(color: Colors.white, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: Text(
          //if condition for changing equation
          sign == "+"
              ? '$number1 + $number2 = ${number1 + number2}'
              : '$number1 - $number2 = ${number1 - number2}',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
