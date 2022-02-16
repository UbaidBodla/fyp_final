import 'package:alphabetgame/eng/constants.dart';
import 'package:alphabetgame/widgets/QuizButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SentScreen extends StatefulWidget {
  SentScreen({Key key}) : super(key: key);

  @override
  _SentScreenState createState() => _SentScreenState();
}

class _SentScreenState extends State<SentScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditHeader(
                title: 'Phonics',
                primaryColor: Colors.purpleAccent[100],
                secondaryColor: Colors.purple[800],
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: QuizButton(onPressed: () {})),
              ImageContainer(
                  screenHeight, screenWidth, SenetencesList[index].image),
              SizedBox(
                height: 15,
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: listofContainers(screenWidth, screenHeight)),
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
                          if (index < SenetencesList.length - 1) {
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

  Row listofContainers(screenWidth, screenHeight) {
    final List<Widget> rowList = [];
    for (int i = 0; i < SenetencesList[index].sentence.length; i++) {
      rowList.addAll([
        WordContainer(
            screenHeight, screenWidth, SenetencesList[index].sentence[i])
      ]);
    }

    final Row rowStars = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowList,
    );

    return rowStars;
  }

  Widget WordContainer(screenHeight, screenWidth, name) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: screenHeight * 10,
          width: screenWidth * 20,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            //border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "$name ",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      onTap: () async {
        _speak(name);
      },
    );
  }

  InkWell ImageContainer(screenHeight, screenWidth, image) {
    return InkWell(
      child: Container(
        height: screenHeight * 40,
        width: screenWidth * 90,
        // decoration: BoxDecoration(
        //   color: Colors.green,
        //   border: Border.all(color: Colors.purpleAccent, width: 4),
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        child: (Image.asset(image)),
      ),
      onTap: () async {
        for (int i = 0; i < SenetencesList[index].sentence.length; i++) {
          _speak(SenetencesList[index].sentence[i]);
          await Future.delayed(const Duration(seconds: 1));
        }
      },
    );
  }
}

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    //animType: AnimType.BOTTOMSLIDE,
    title: 'Sentence',
    desc: 'This screen your will learn the sentences.',
    btnCancelText: "Got it",
    showCloseIcon: false,
    // btnCancelOnPress: () {
    //   //dispose();

    //   Navigator.pop(context);
    // },
  )..show();
}
