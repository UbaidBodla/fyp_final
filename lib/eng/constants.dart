import 'package:alphabetgame/widgets/page_header.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Item {
  String name;
  String image;
  Item({this.name, this.image});
}

List<Item> ItemList = [
  Item(name: 'Mango', image: 'assets/friuts/Mango.png'),
  Item(name: 'Tiger', image: 'assets/animal/Tiger.png'),
  Item(name: 'Zebra', image: 'assets/animal/Zebra.png'),
  Item(name: 'Grapes', image: 'assets/friuts/Grapes.png'),
  Item(name: 'Orange', image: 'assets/friuts/Orange.png')
];

class Sentence {
  List sentence;
  String image;
  Sentence({this.sentence, this.image});
}

List<Sentence> SenetencesList = [
  Sentence(
      sentence: ['This', 'is', 'a', 'Mango'], image: 'assets/friuts/Mango.png'),
  Sentence(
      sentence: ['This', 'is', 'a', 'Tiger'], image: 'assets/animal/Tiger.png'),
  Sentence(
      sentence: ['This', 'is', 'a', 'Zebra'], image: 'assets/animal/Zebra.png'),
  Sentence(
      sentence: ['This', 'is', 'a', 'Grape'],
      image: 'assets/friuts/Grapes.png'),
  Sentence(
      sentence: ['This', 'is', 'an', 'Orange'],
      image: 'assets/friuts/Orange.png')
];

//Edit Header
class EditHeader extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const EditHeader({
    Key key,
    this.title,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/bg-stars.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '<<',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MessageBox(context);
                  },
                  child: Icon(
                    Icons.help_outline_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            "$title",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    //animType: AnimType.BOTTOMSLIDE,
    title: 'Word Phoenix',
    desc: 'Click on image/name pronounce the object name.',
    btnCancelText: "Got it",
    showCloseIcon: false,
    // btnCancelOnPress: () {
    //   //dispose();

    //   Navigator.pop(context);
    // },
  )..show();
}
