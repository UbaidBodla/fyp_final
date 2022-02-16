import 'package:alphabetgame/science/Constants.dart';
import 'package:alphabetgame/science/Widget/ItemDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScienceStoryScreen extends StatefulWidget {
  const ScienceStoryScreen({Key key}) : super(key: key);

  @override
  _ScienceStoryScreenState createState() => _ScienceStoryScreenState();
}

class _ScienceStoryScreenState extends State<ScienceStoryScreen> {
  @override
  Widget build(BuildContext context) {
    //double screenHeight = (MediaQuery.of(context).size.height / 100);
    //double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Theories"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemDisplay(
                title: itemList[0].title,
                detail: itemList[0].detail,
                image: itemList[0].image),
            Divider(
              color: Colors.red,
              height: 3,
              thickness: 3,
            ),
            ItemDisplay(
                title: itemList[1].title,
                detail: itemList[1].detail,
                image: itemList[1].image),
            Divider(
              color: Colors.red,
              height: 3,
              thickness: 3,
            ),
            ItemDisplay(
                title: itemList[2].title,
                detail: itemList[2].detail,
                image: itemList[2].image),
            Divider(
              color: Colors.red,
              height: 3,
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}
