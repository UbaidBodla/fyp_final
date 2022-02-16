import 'dart:math';

import 'package:alphabetgame/eng/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
// import 'package:confetti/confetti.dart';

class WordQuizScreen extends StatefulWidget {
  const WordQuizScreen({Key key}) : super(key: key);

  @override
  _WordQuizScreenState createState() => _WordQuizScreenState();
}

// ConfettiController _controllerCenter;
String _chars = 'abcdefghijklmnopqrstuvwxyz';
int randomIndex;
int index = Random().nextInt(ItemList.length);
int optionOneIndex = Random().nextInt(_chars.length);
int optionTwoIndex = Random().nextInt(_chars.length);
void checkSameOption() {
  while (index == optionOneIndex ||
      index == optionTwoIndex ||
      optionOneIndex == optionTwoIndex) {
    optionOneIndex = Random().nextInt(_chars.length);
    optionTwoIndex = Random().nextInt(_chars.length);
  }
}

final FlutterTts _flutterTts = FlutterTts();

Future _speak(text) async {
  await _flutterTts.setLanguage("en-AU");
  await _flutterTts.setSpeechRate(1.0);
  await _flutterTts.setVolume(1.0);
  await _flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
  await _flutterTts.setPitch(1.0);
  await _flutterTts.speak('{$text}');
  //await _flutterTts.
  //await _flutterTts.awaitSpeakCompletion(true);
}

class _WordQuizScreenState extends State<WordQuizScreen> {
  void initState() {
    super.initState();
    // _controllerCenter =
    //     ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);

    //intialize the random variable to miss any random index of word.
    randomIndex = Random().nextInt(ItemList[index].name.length);
    checkSameOption();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phonics Quiz'),
            Container(
              height: screenHeight * 10,
              width: screenWidth * 10,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    MessageBox(context);
                  },
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.help_outline_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.blueGrey,
                    child: Column(
                        children: [
                      AlphaContainer(
                          screenHeight, screenWidth, _chars[optionOneIndex]),
                      AlphaContainer(screenHeight, screenWidth,
                          ItemList[index].name[randomIndex]),
                      AlphaContainer(
                          screenHeight, screenWidth, _chars[optionTwoIndex]),
                    ]..shuffle()),
                  ),
                  ImageContainer(
                      screenHeight, screenWidth, ItemList[index].image),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              listAnswerAlphabets(screenWidth, screenHeight),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (index > 0) {
                            index--;
                            setState(() {
                              this.widget;
                            });
                          }
                        },
                        child: Text(
                          '←Previous',
                          style: TextStyle(
                            fontSize: 20.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          if (index < ItemList.length - 1) {
                            index++;
                            setState(() {
                              this.widget;
                            });
                          }
                        },
                        child: Text(
                          'Next→',
                          style: TextStyle(
                            fontSize: 20.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //Method that check that four option numbers are not same.
  }

  Row listAnswerAlphabets(screenWidth, screenHeight) {
    final List<Widget> rowList = [];
    for (int i = 0; i < ItemList[index].name.length; i++) {
      if (randomIndex == i) {
        rowList.addAll([TargetContainer()]);
      } else {
        rowList.addAll([
          AlphaContainer(screenHeight, screenWidth, ItemList[index].name[i])
        ]);
      }
    }

    final Row rowStars = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowList,
    );

    return rowStars;
  }

  Widget AlphaContainer(screenHeight, screenWidth, name) {
    return Draggable(
        data: name,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              height: screenHeight * 10,
              width: screenWidth * 10,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                //border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            onTap: () async {
              _speak(name);
            },
          ),
        ),
        feedback: Text(
          name,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        childWhenDragging: Container());
  }

  InkWell WordContainer(screenHeight, screenWidth, name) {
    return InkWell(
      child: Container(
        height: screenHeight * 10,
        width: screenWidth * 90,
        color: Colors.indigoAccent,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      onTap: () async {
        for (int i = 0; i < name.length; i++) {
          _speak(name[i]);
          await Future.delayed(const Duration(seconds: 1));
        }
        _speak(name);
      },
    );
  }

  Container ImageContainer(screenHeight, screenWidth, image) {
    return Container(
      height: screenHeight * 50,
      width: screenWidth * 80,
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        border: Border.all(color: Colors.deepPurple, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: (Image.asset(image)),
    );
  }
}

class TargetContainer extends StatefulWidget {
  final int id;
  TargetContainer({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _TargetContainerState createState() => _TargetContainerState();
}

class _TargetContainerState extends State<TargetContainer> {
  bool check = false;

  String char = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return DragTarget(builder: (context, List candidateData, rejectedData) {
      return Container(
        height: screenHeight * 10,
        width: screenWidth * 10,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          //border: Border.all(color: Colors.white, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            char,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }, onWillAccept: (data) {
      return true;
    }, onAccept: (String data) {
      if (ItemList[index].name[randomIndex] == data) {
        print('True');
        _speak('true');
        char = data;
      } else {
        _speak("False");
        print('false');
      }
    });
  }
}

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    //animType: AnimType.BOTTOMSLIDE,
    title: 'Word Quiz',
    desc:
        'Fill the Missing Alphabet of the Word.\n you can also learn spelling of other words',
    btnCancelText: "Got it",
    showCloseIcon: false,
    // btnCancelOnPress: () {
    //   //dispose();

    //   Navigator.pop(context);
    // },
  )..show();
}
