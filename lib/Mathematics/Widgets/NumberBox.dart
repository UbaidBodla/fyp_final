//Circle Container: Circular container that display numbers and signs.
import 'package:alphabetgame/widgets/BackVoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberBox extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String number;
  final Color boxColor;
  final bool check;

  NumberBox(
      {Key key,
      this.screenHeight,
      this.screenWidth,
      this.number,
      this.boxColor,
      this.check})
      : super(key: key);
  VoiceClass voice = new VoiceClass();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (check == true) {
          voice.speak('Correct');
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Right!")));
        } else {
          voice.speak('Noo');
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Wroung!")));
        }
      },
      child: Container(
          height: screenHeight * 18,
          width: screenWidth * 18,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            color: boxColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }
}
