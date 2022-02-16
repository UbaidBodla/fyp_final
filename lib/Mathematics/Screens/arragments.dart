import 'dart:math';
import 'package:alphabetgame/Mathematics/Widgets/CircleButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrangeNumberScreen extends StatefulWidget {
  const ArrangeNumberScreen({Key key}) : super(key: key);

  @override
  _ArrangeNumberScreenState createState() => _ArrangeNumberScreenState();
}

List<int> check = [-1, -1, -1, -1];

class _ArrangeNumberScreenState extends State<ArrangeNumberScreen> {
  int number1 = Random().nextInt(21);
  int number2 = Random().nextInt(21);
  int number3 = Random().nextInt(21);
  int number4 = Random().nextInt(21);
  Color box1Color = Color.fromRGBO(247, 190, 109, 1); //rgb(247, 190, 109)
  Color box2Color = Color.fromRGBO(247, 190, 109, 1);
  Color box3Color = Color.fromRGBO(247, 190, 109, 1);
  Color box4Color = Color.fromRGBO(247, 190, 109, 1);
  bool checkBoxNumber = false;
  bool value0 = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  @override
  Widget build(BuildContext context) {
    //check that the all four numbers are not same.
    checkSameOptionNumber();

    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
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
                Text(
                  'Sorting',
                  style: TextStyle(fontSize: 30),
                ),
                InkWell(
                  child: CircleButton(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      icon: Icons.help,
                      boxColor: Colors.amber),
                  onTap: () {
                    MessageBox(context);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/mathematics/nature.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Arrange Numbers',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(247, 68, 36, 1)), //rgb(247, 68, 36)
                ),
                Container(
                  height: screenHeight * 50,
                  width: screenWidth * 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 8),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(19, 38, 214, 1), //rgb(19, 38, 214)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DragContainer(
                            containerId: 0,
                            boxColor: box1Color,
                          ),
                          signBox(),
                          DragContainer(
                            containerId: 1,
                            boxColor: box2Color,
                          ),
                          signBox(),
                          DragContainer(
                            containerId: 2,
                            boxColor: box3Color,
                          ),
                          signBox(),
                          DragContainer(
                            containerId: 3,
                            boxColor: box4Color,
                          ),
                        ],
                      ),
                      //answerContainer(screenHeight, screenWidth, value),
                      //Option Container
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCircle(screenHeight, screenWidth, number1),
                          getCircle(screenHeight, screenWidth, number2),
                          getCircle(screenHeight, screenWidth, number3),
                          getCircle(screenHeight, screenWidth, number4)
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        List<int> listx = [number1, number2, number3, number4];
                        listx.sort();
                        setState(() {
                          if (check[0] == listx[0]) {
                            box1Color = Colors.green;
                            value0 = true;
                          } else {
                            box1Color = Colors.red;
                            value0 = false;
                          }

                          if (check[1] == listx[1]) {
                            box2Color = Colors.green;
                            value1 = true;
                          } else {
                            box2Color = Colors.red;
                            value1 = false;
                          }

                          if (check[2] == listx[2]) {
                            box3Color = Colors.green;
                            value2 = true;
                          } else {
                            box3Color = Colors.red;
                            value2 = false;
                          }

                          if (check[3] == listx[3]) {
                            box4Color = Colors.green;
                            value3 = true;
                          } else {
                            box4Color = Colors.red;
                            value3 = false;
                          }
                        });

                        if (value0 && value1 && value2 && value3) {
                          showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) =>
                                  AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text(
                                        "You arranged the numbers correctly"),
                                  ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Please arrange in correct order!")));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                //answerContainer(screenHeight, screenWidth, value0)
              ],
            ),
          )),
    );
  }

  Text signBox() {
    return Text(
      ' < ',
      style: TextStyle(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Padding getContainer(screenHeight, screenWidth, number) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: screenHeight * 15,
        width: screenWidth * 15,
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }

  // Container answerContainer(screenHeight, screenWidth, value) {
  //   return Container(
  //     height: screenHeight * 5,
  //     width: screenWidth * 25,
  //     color: Colors.blue,
  //     child: Center(
  //       child: Text(
  //         '$value',
  //         style: TextStyle(
  //             fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow),
  //       ),
  //     ),
  //   );
  // }

  Padding getCircle(screenHeight, screenWidth, number) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: number,
        child: Container(
          height: screenHeight * 18,
          width: screenWidth * 18,
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.blue, width: 3),

            color: Color.fromRGBO(225, 49, 130, 1), //rgb(225, 49, 130)
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        feedback: Text(
          '$number',
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(95, 239, 206, 1)), //rgb(95, 239, 206)
        ),
        childWhenDragging: Container(
          height: screenHeight * 18,
          width: screenWidth * 18,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(''),
          ),
        ),
      ),
    );
  }

  //Method that check that four option numbers are not same.
  void checkSameOptionNumber() {
    while (number1 == number2 ||
        number1 == number3 ||
        number1 == number4 ||
        number2 == number3 ||
        number2 == number4 ||
        number3 == number4) {
      number1 = Random().nextInt(21);
      number2 = Random().nextInt(21);
      number3 = Random().nextInt(21);
      number4 = Random().nextInt(21);
    }
  }
}

class DragContainer extends StatefulWidget {
  final int containerId;
  final Color boxColor;
  DragContainer({
    Key key,
    this.containerId,
    this.boxColor,
  }) : super(key: key);

  @override
  _DragContainerState createState() => _DragContainerState();
}

class _DragContainerState extends State<DragContainer> {
  int boxNumber;
  bool checkBoxEmpty = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      height: screenHeight * 12,
      width: screenWidth * 12,
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: widget.boxColor,
        border: Border.all(
            color: Color.fromRGBO(14, 239, 14, 1), width: 3), //rgb(14, 239, 14)
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: DragTarget(
        builder: (context, List candidateData, rejectedData) {
          return checkBoxEmpty
              ? Center(
                  child: Text('$boxNumber',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                )
              : Text(
                  '',
                );
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (int data) {
          setState(() {
            boxNumber = data;
            checkBoxEmpty = true;
            switch (widget.containerId) {
              case 0:
                check[0] = data;

                break;
              case 1:
                check[1] = data;

                break;
              case 2:
                check[2] = data;

                break;
              case 3:
                check[3] = data;

                break;

              default:
                break;
            }
          });
        },
      ),
    );
  }
}

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    //animType: AnimType.BOTTOMSLIDE,
    title: 'Sorting',
    desc: 'Arrange the given numbers in correct sequence',
    btnCancelText: "Got it",
    showCloseIcon: false,
    // btnCancelOnPress: () {
    //   //dispose();

    //   Navigator.pop(context);
    // },
  )..show();
}
