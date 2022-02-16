import 'package:alphabetgame/science/Constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyQuizScreen extends StatefulWidget {
  const BodyQuizScreen({Key key}) : super(key: key);

  @override
  _BodyQuizScreenState createState() => _BodyQuizScreenState();
}

List<BodyParts> PartsofBodyList = BodyPartsList;
int count = 0;

class _BodyQuizScreenState extends State<BodyQuizScreen> {
  ListView listofOptionContainers(screenWidth, screenHeight) {
    final List<Widget> itemList = [];

    for (int i = 0; i < PartsofBodyList.length; i++) {
      itemList.addAll([
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Draggable<int>(
            data: PartsofBodyList[i].id,
            child: Container(
              height: screenHeight * 8,
              width: screenWidth * 15,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.deepPurple, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  PartsofBodyList[i].name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            feedback: Text(
              PartsofBodyList[i].name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            childWhenDragging: Container(),
            //onDragCompleted: () {},
          ),
        )
      ]);
    }

    final ListView ListViewStar = ListView(
      children: itemList,
    );

    return ListViewStar;
  }

  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                    ]).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),
              Text('Parts of Body'),
              //Text(count.toString()),
              Container(
                height: screenHeight * 10,
                width: screenWidth * 10,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      helpMessage(context);
                    },
                    backgroundColor: Color.fromRGBO(98, 65, 31, 1),
                    child: Icon(Icons.help_outline_outlined),
                  ),
                ),
              ),
            ],
          )),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 80,
              width: screenWidth * 20,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.deepPurple, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: listofOptionContainers(screenWidth, screenHeight),
            ),
            Center(
              child: Container(
                height: screenHeight * 100,
                width: screenWidth * 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //border: Border.all(color: Colors.deepPurple, width: 4),
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage("assets/3d/quizbody.PNG"),
                      fit: BoxFit.fitHeight),
                ),
                child: Stack(
                  children: [
                    TargetContainer(
                      id: 0, //hair box
                      top: 18,
                      left: 10,
                      linelength: 180,
                      check: true,
                    ),

                    TargetContainer(
                      id: 1, //eye id
                      top: 40,
                      left: 130,
                      linelength: 70,
                      check: true,
                    ),
                    TargetContainer(
                      id: 2, //arm box
                      top: 120,
                      left: 100,
                      linelength: 70,
                      check: true,
                    ),
                    TargetContainer(
                      id: 3, //leg box
                      top: 200,
                      left: 10,
                      linelength: 180,
                      check: true,
                    ),
                    TargetContainer(
                      id: 4, //foot box
                      top: 245,
                      left: 130,
                      linelength: 60,
                      check: true,
                    ),
                    //Right side of body box
                    TargetContainer(
                      id: 5, //neck
                      top: 70,
                      right: 60,
                      linelength: 145,
                      check: false,
                    ),
                    TargetContainer(
                      id: 6, // Stomach
                      top: 120,
                      right: 40,
                      linelength: 150,
                      check: false,
                    ),
                    TargetContainer(
                      id: 7, //hand
                      top: 160,
                      right: 90,
                      linelength: 70,
                      check: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class TargetContainer extends StatelessWidget {
  final int id;
  final double top;
  final double left;
  final double right;
  final double linelength;
  final bool check;
  int index = -1;
  TargetContainer(
      {Key key,
      @required this.id,
      this.top,
      this.left,
      this.right,
      this.linelength,
      @required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Positioned(
        top: this.top,
        left: this.left,
        right: this.right,
        child: Row(
          children: [
            check
                ? Container()
                : Container(
                    height: 3,
                    width: this.linelength,
                    color: Colors.black,
                  ),
            DragTarget(builder: (context, List candidateData, rejectedData) {
              return Container(
                  height: screenHeight * 8,
                  width: screenWidth * 15,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    border: Border.all(color: Colors.deepPurple, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                      child: index == -1
                          ? Text('')
                          : Text(
                              PartsofBodyList[index].name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )));
            }, onWillAccept: (data) {
              return true;
            }, onAccept: (int data) {
              if (data == this.id) {
                index = data;
                count++;
                print(count);
                if (count > 7) {
                  showWonDialogue(context);
                  count = 0;
                }
              }
            }),
            check
                ? Container(
                    height: 3,
                    width: this.linelength,
                    color: Colors.black,
                  )
                : Container(),
          ],
        ));
  }
}

void helpMessage(context) {
  showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text('Help'),
          content: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: SingleChildScrollView(
              child: Text(
                  'Identify the Parts of Body and Fill the labelled Boxes with names which are given to you in left side by dragging them.'),
            ),
          ),
        );
      });
}

showWonDialogue(context) {
  // _controllerCenter.play();

  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.RIGHSLIDE,
    title: 'Congratulations!',
    desc: 'You won!',
    btnCancelText: "Back",
    showCloseIcon: false,
    btnOkText: "Restart",
    btnCancelOnPress: () {
      //dispose();

      Navigator.pop(context);
    },
    btnOkOnPress: () {},
  )..show();
}
