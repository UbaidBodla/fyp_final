import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      width: screenWidth * 30,
      height: screenHeight * 5,
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            "Try Quiz",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
