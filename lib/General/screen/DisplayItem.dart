import 'dart:ui';
import 'package:alphabetgame/General/constants.dart';
import 'package:alphabetgame/widgets/QuizButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DisplayItemScreen extends StatefulWidget {
  final String title;
  final List<GeneraItemDataModel> GeneralItemList;

  DisplayItemScreen({Key key, this.title, this.GeneralItemList})
      : super(key: key);
  @override
  _DisplayItemScreenState createState() => _DisplayItemScreenState();
}

class _DisplayItemScreenState extends State<DisplayItemScreen> {
  String name;
  String picture;
  void MessageBox(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      title: widget.title,
      desc:
          'Shown the ${widget.title} and there name\n scroll the down list to see anothers.',
      btnCancelText: "Got it",
      showCloseIcon: false,
    )..show();
  }

  Row listofContainers(screenWidth, screenHeight, GeneralItemList) {
    final List<Widget> rowList = [];
    for (int i = 0; i < GeneralItemList.length; i++) {
      rowList.addAll([
        getContainer(GeneralItemList[i].name, GeneralItemList[i].image,
            screenWidth, screenHeight),
      ]);
    }

    final Row rowStars = Row(
      children: rowList,
    );

    return rowStars;
  }

  final FlutterTts _flutterTts = FlutterTts();
  Future _speak() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(.1);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak("$name");
    //_speakagain();
  }

  // ignore: must_call_super
  void initState() {
    name = widget.GeneralItemList[0].name;
    picture = widget.GeneralItemList[0].image;
  }

  //final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenHeight * 10,
                  width: screenWidth * 10,
                  child: FittedBox(
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Color.fromRGBO(98, 65, 31, 1),
                      child: Icon(Icons.keyboard_backspace_rounded),
                    ),
                  ),
                ),
                Container(
                  //margin: new EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 3.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.amber[200], fontSize: 25),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(98, 65, 31, 1), //rgb(98, 65, 31)
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  height: screenHeight * 10,
                  width: screenWidth * 10,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: () {
                        MessageBox(context);
                      },
                      backgroundColor: Color.fromRGBO(98, 65, 31, 1),
                      child: Icon(Icons.help_outline_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/appBarback.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            //color: Color.fromRGBO(0, 255, 0, 1), //rgb(0, 255, 0)
            image: DecorationImage(
              image: AssetImage('assets/112.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: QuizButton(onPressed: () {})),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: new TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              imageMethod(screenHeight, screenWidth),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: screenHeight * 17,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(117, 48, 0, 1), //rgb(117, 48, 0)
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 15,
                          width: screenWidth * 85,

                          decoration: BoxDecoration(
                            color: Color.fromRGBO(175, 98, 29, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            //controller: controller,
                            child: listofContainers(screenWidth, screenHeight,
                                widget.GeneralItemList),
                          ), //rgb(175, 98, 29)
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding imageMethod(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        color: Colors.transparent,
        height: screenHeight * 50,
        width: screenWidth * 95,
        child: Center(
          child: Image(image: AssetImage(picture)),
        ),
      ),
    );
  }

  Container getMianContainer(
      String image, double screenHeight, double screenWidth) {
    return Container(
      color: Colors.transparent,
      height: screenHeight * 50,
      width: screenWidth * 95,
      child: Center(
        child: Image(image: AssetImage(picture)),
      ),
    );
  }

  Widget getContainer(String naam, String image, screenWidth, screenHeight) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
            color: Color.fromRGBO(
                130, 198, 27, 1), //rgb(98, 166, 223)rgb(130, 198, 27)
            //border: Border.all(color: Colors.green, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(20) //
                ),
          ),
          height: screenHeight * 15,
          width: screenWidth * 25,
        ),
      ),
      onTap: () {
        name = naam;
        picture = image;
        _speak();
        setState(() {
          super.widget;
        });
        //
      },
    );
  }
}
