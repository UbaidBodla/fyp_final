import 'package:alphabetgame/eng/Sent.dart';
import 'package:alphabetgame/eng/WordQuiz.dart';
import 'package:alphabetgame/eng/constants.dart';
import 'package:alphabetgame/widgets/QuizButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordScreen extends StatefulWidget {
  WordScreen({Key key}) : super(key: key);

  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  int index = 0;

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

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditHeader(
                title: 'Phoenix',
                primaryColor: Colors.purpleAccent[100],
                secondaryColor: Colors.purple[800],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: screenHeight * 5,
                        width: screenWidth * 25,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Text('Learn Sentence',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ))),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: QuizButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WordQuizScreen(),
                          ),
                        );
                      })),
                ],
              ),
              ImageContainer(screenHeight, screenWidth, ItemList[index].image),
              SizedBox(
                height: 15,
              ),
              WordContainer(screenHeight, screenWidth, ItemList[index].name),
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
                            fontSize: 25.0,
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
                            fontSize: 25.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell WordContainer(screenHeight, screenWidth, name) {
    return InkWell(
      child: Container(
        height: screenHeight * 10,
        width: screenWidth * 90,
        color: Colors.redAccent,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 50.0,
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
      height: screenHeight * 40,
      width: screenWidth * 90,
      //color: Colors.green,
      child: (Image.asset(image)),
    );
  }
}
