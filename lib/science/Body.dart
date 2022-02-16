import 'dart:ui';
import 'package:alphabetgame/science/BodyQuiz.dart';
import 'package:alphabetgame/widgets/QuizButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:model_viewer/model_viewer.dart';
import 'FullBody.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({Key key}) : super(key: key);
  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  String name;
  String picture;
  String model;
  Row listofContainers(screenWidth, screenHeight, modelList) {
    final List<Widget> rowList = [];
    for (int i = 0; i < modelList.length; i++) {
      rowList.addAll([
        getContainer(modelList[i].name, modelList[i].image, modelList[i].model,
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
    name = modelList[0].name;
    picture = modelList[0].image;
    model = modelList[0].model;
  }

  //final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(model);
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
                      "Parts of Body",
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
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullBodyView(),
                          ),
                        );
                      },
                      child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Text(
                                'View Full Body',
                                style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: QuizButton(onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BodyQuizScreen(),
                        ),
                      );
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        //DeviceOrientation.portraitDown,
                      ]);
                    }),
                  ),
                ],
              ),
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
                            child: listofContainers(
                                screenWidth, screenHeight, modelList),
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
    print("IMAGE METHOD REBUILD $model");
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        //color: Colors.transparent,
        height: screenHeight * 50,
        width: screenWidth * 95,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.deepPurple, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: ModelViewer(
            key: ValueKey(model),
            src: model,
            alt: "A 3D model of an astronaut",
            ar: true,
            autoRotate: true,
            cameraControls: true,
          ),
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

  Widget getContainer(
      String naam, String image, String model1, screenWidth, screenHeight) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
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
        model = model1;
        _speak();
        setState(() {
          super.widget;
        });
        //
      },
    );
  }
}

//Data Model Class: make class for data models of object records.
class Model {
  String name;
  String image;
  String model;
  Model({this.name, this.image, this.model});
}

//Object List:list of object which contains data as object record class model form.
List<Model> modelList = [
  Model(
      name: 'Head',
      image: "assets/3d/head.jpg",
      model: "assets/3d/ModelFile/head.glb"),
  Model(
      name: 'Eye',
      image: "assets/3d/eye.jpg",
      model: "assets/3d/ModelFile/eye.glb"), // // assets/3d/ModelFile/eye.glb
  Model(
      name: 'Hand',
      image: "assets/3d/hand.jpg",
      model: "assets/3d/ModelFile/skull.gltf"),
  Model(
      name: 'Teeth',
      image: "assets/3d/teeth.PNG", // assets/3d/foot.PNG
      model: "assets/3d/ModelFile/teeth.glb"),
  Model(
      name: 'Foot',
      image: "assets/3d/foot.jpg",
      model: "assets/3d/ModelFile/skull.gltf"),
  Model(
      name: 'Leg',
      image: "assets/3d/leg.png",
      model: "assets/3d/ModelFile/legs.glb"),
  Model(
      name: 'Body',
      image: "assets/3d/body.PNG",
      model:
          "assets/3d/ModelFile/body.glb"), //alphabetgame\assets\3d\stomoch.PNG
];

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    title: "Parts of Body",
    desc:
        '3D view some basic parts of body and there names. scroll down list to see the others',
    btnCancelText: "Got it",
    showCloseIcon: false,
  )..show();
}
