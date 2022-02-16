import 'dart:math';
import 'package:alphabetgame/Mathematics/Screens/AdditionSubstractionQuizScreen.dart';
import 'package:alphabetgame/Mathematics/Widgets/EquationContainer.dart';
import 'package:alphabetgame/Mathematics/Widgets/ImagesContainer.dart';
import 'package:alphabetgame/widgets/BackVoice.dart';
import 'package:alphabetgame/widgets/QuizButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class AdditionSubstractionScreen extends StatefulWidget {
  final String title;
  final String sign;

  const AdditionSubstractionScreen({Key key, this.title, this.sign})
      : super(key: key);

  @override
  _AdditionSubstractionScreenState createState() =>
      _AdditionSubstractionScreenState();
}

class _AdditionSubstractionScreenState
    extends State<AdditionSubstractionScreen> {
  int number1;
  int number2;
  VoiceClass voice = new VoiceClass();
  @override
  Widget build(BuildContext context) {
    number1 = Random().nextInt(5);
    number2 = Random().nextInt(5);
    checkNumber();
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/mathematics/nature.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                        heroTag: null,
                        child: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              QuizButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AdditionSubstractionQuizScreenQuizScreen(
                        sign: widget.sign,
                        title: widget.title,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      ImagesContainer(
                        height: screenHeight * 50,
                        width: screenWidth * 30,
                        image: objectList[number1].image,
                        end: number1,
                        isColumn: true,
                      ),
                      Positioned(
                        bottom: 350,
                        left: 20,
                        child: ValueBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          value: objectList[number1].number.toString(),
                        ),
                      ),
                    ],
                  ),
                  //Sign displaying container.
                  ValueBox(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      value: widget.sign),
                  Stack(
                    children: [
                      ImagesContainer(
                        height: screenHeight * 50,
                        width: screenWidth * 30,
                        image: objectList[number1].image,
                        end: number2,
                        isColumn: true,
                      ),
                      Positioned(
                        bottom: 350,
                        left: 20,
                        child: ValueBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            value: objectList[number2].number.toString()),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      voice.speak(
                          '${number1} + ${number2} = ${number1 + number2}');
                    },
                    icon: Icon(
                      Icons.volume_down_sharp,
                    ),
                    iconSize: 60,
                    color: Colors.deepOrangeAccent[400],
                  ),
                  EquationContainer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    number1: number1,
                    number2: number2,
                    sign: widget.sign,
                    backColor: Colors.deepOrange,
                  ),
                  nextButton(),
                ],
              ),
              ImagesContainer(
                height: screenHeight * 15,
                width: screenWidth * 95,
                image: objectList[number1].image,
                end: widget.sign == "+" ? number1 + number2 : number1 - number2,
                isColumn: false,
              )
            ],
          ),
        ),
      ),
    );
  }

//Equation: display the calcuation eqaution of numbers.
  Text getEquation() {
    String equation;
    if (widget.sign == "+") {
      equation = '$number1 + $number2 = ${number1 + number2}';
    } else {
      equation = '$number1 - $number2 = ${number1 - number2}';
    }
    return Text(
      equation,
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  //method to check that in substraction method first number is greater than second one to prevent negative value.
  void checkNumber() {
    if (widget.sign == "-") {
      while (number1 < number2) {
        number1 = Random().nextInt(5);
        number2 = Random().nextInt(5);
      }
    }
  }

  Widget nextButton() {
    return TextButton(
        child: Icon(
          Icons.skip_next,
          color: Colors.deepOrangeAccent[400],
          size: 60,
        ),
        onPressed: () {
          setState(() {
            this.widget;
          });
        });
  }
}

//Circle Container: Circular container that display numbers and signs.
class ValueBox extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String value;
  const ValueBox({Key key, this.screenHeight, this.screenWidth, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 18,
        width: screenWidth * 18,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 3),
          image: new DecorationImage(
            image: new AssetImage("assets/mathematics/bubble.png"),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$value',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ));
  }
}
