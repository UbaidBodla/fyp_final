import 'dart:math';
import 'package:alphabetgame/Mathematics/Widgets/CircleButton.dart';
import 'package:alphabetgame/Mathematics/Widgets/ImagesContainer.dart';
import 'package:alphabetgame/Mathematics/Widgets/NumberBox.dart';
import 'package:alphabetgame/widgets/BackVoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionSubstractionQuizScreenQuizScreen extends StatefulWidget {
  final String title;
  final String sign;
  const AdditionSubstractionQuizScreenQuizScreen(
      {Key key, this.title, this.sign})
      : super(key: key);

  @override
  _AdditionSubstractionQuizScreenQuizScreenState createState() =>
      _AdditionSubstractionQuizScreenQuizScreenState();
}

class _AdditionSubstractionQuizScreenQuizScreenState
    extends State<AdditionSubstractionQuizScreenQuizScreen> {
  int number1;
  int number2;
  int option1;
  int option2;
  int option3;
  int answer;
  @override
  Widget build(BuildContext context) {
    //intialize number randamly.
    number1 = Random().nextInt(5);
    number2 = Random().nextInt(5);
    //intialize options randamly.
    option1 = Random().nextInt(10);
    option2 = Random().nextInt(10);
    option3 = Random().nextInt(10);
    //calculate the anwser
    if (widget.sign == '+') {
      answer = number1 + number2;
    } else {
      checkNumber();
      answer = number1 - number2;
    }

    checkSameOptionNumber();
    //checkindex()
    //MediaQuery variables for responsiveness
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: CircleButton(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.home,
                        boxColor: Colors.amber),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      //border: Border.all(color: Colors.white, width: 4),
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
                  InkWell(
                    child: CircleButton(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.help,
                        boxColor: Colors.amber),
                    onTap: () {},
                  ),
                ],
              ),
              Container(
                height: screenHeight * 84,
                width: screenWidth * 90,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(254, 203, 68, 1),
                      width: 10), //rgb(254, 203, 68)
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color.fromRGBO(146, 152, 250, 1), //rgb(146, 152, 250)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getEquation(screenHeight, screenWidth, widget.sign),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImagesContainer(
                            height: screenHeight * 50,
                            width: screenWidth * 30,
                            image: "assets/mathematics/Banana.png",
                            isColumn: true,
                            end: number1),
                        Text(widget.sign,
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        ImagesContainer(
                            height: screenHeight * 50,
                            width: screenWidth * 30,
                            image: "assets/mathematics/Banana.png",
                            isColumn: true,
                            end: number2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          number: option1.toString(),
                          boxColor: Colors.indigo,
                          check: false,
                        ),
                        NumberBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          number: option2.toString(),
                          boxColor: Colors.green,
                          check: false,
                        ),
                        NumberBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          number: option3.toString(),
                          boxColor: Colors.yellow,
                          check: false,
                        ),
                        NumberBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          number: answer.toString(),
                          boxColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          check: true,
                        )
                      ]..shuffle(),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          this.widget;
                        });
                      },
                      child: Text(
                        'Next -->',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Method that confirm all the provided numbers are not same.
  void checkSameOptionNumber() {
    while (answer == option1 ||
        answer == option2 ||
        answer == option3 ||
        option1 == option2 ||
        option2 == option3 ||
        option1 == option3) {
      option1 = new Random().nextInt(10);
      option2 = new Random().nextInt(10);
      option3 = new Random().nextInt(10);
    }
  }

//method that display the equation of numbers.
  Container getEquation(screenHeight, screenWidth, sign) {
    return Container(
      height: screenHeight * 8,
      width: screenWidth * 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(92, 99, 189, 1),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: Text(
          '$number1 $sign $number2 = ?',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

//check the number2 is smaller than number1 for substraction.
  void checkNumber() {
    if (widget.sign == "-") {
      while (number1 < number2) {
        number1 = Random().nextInt(5);
        number2 = Random().nextInt(5);
      }
    }
  }
}
