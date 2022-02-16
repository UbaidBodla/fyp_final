import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../EnlargeStory.dart';

class ItemDisplay extends StatelessWidget {
  final String title;
  final String detail;
  final String image;
  ItemDisplay({
    Key key,
    this.title,
    this.detail,
    this.image,
  }) : super(key: key);
  final FlutterTts _flutterTts = FlutterTts();

  Future _speak(text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(1);
    await _flutterTts.setVolume(1.0);
    //await _flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    await _flutterTts.setPitch(1);
    await _flutterTts.speak('{$text}');
    //await _flutterTts.
    //await _flutterTts.awaitSpeakCompletion(true);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      height: screenHeight * 35,
      width: screenWidth * 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          height: screenHeight * 10,
          width: screenWidth * 100,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenHeight * 10,
                  width: screenWidth * 15,
                  child: Card(
                    shape: CircleBorder(),
                    child: IconButton(
                      onPressed: () {
                        _speak(title);
                      },
                      icon: Icon(
                        Icons.music_note_sharp,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                    height: screenHeight * 10,
                    width: screenWidth * 60,
                    child: Column(
                      children: [
                        Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.white,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Card(
                  shape: CircleBorder(),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnlargeStoryScreen(
                              title: title, detail: detail, image: image),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.read_more,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
