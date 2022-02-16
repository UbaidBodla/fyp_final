import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final IconData icon;
  final Color boxColor;

  const CircleButton({
    Key key,
    this.screenHeight,
    this.screenWidth,
    this.icon,
    this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 12,
        width: screenWidth * 12,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 3),
          color: boxColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
          ),
        ));
  }
}
