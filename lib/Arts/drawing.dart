import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'DrawnLine.dart';
import 'Sketcher.dart';

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  GlobalKey _globalKey = new GlobalKey();
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine line;
  Color selectedColor = Colors.black;
  double strokeWidth = 0.0;
  String picturename;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokeWidth = 8.0;
  }

  StreamController<List<DrawnLine>> linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  Future<void> _save() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    //Request permissions if not already granted
    if (!(await Permission.storage.status.isGranted))
      await Permission.storage.request();

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 60,
        name: picturename);
    print(result);
  }

  Future<void> clear() async {
    setState(() {
      lines = [];
      line = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: screenHeight * 85,
                    width: screenWidth * 75,
                    child: buildAllPaths(context),
                  ),
                  Center(
                    child: Container(
                        height: screenHeight * 85,
                        width: screenWidth * 85,
                        child: buildCurrentPath(context)),
                  ),
                ],
              ),
              Container(child: buildColorToolbar(screenHeight, screenWidth)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildStrokeToolbar(screenHeight, screenWidth),
              buildClearButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          padding: EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<DrawnLine>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: Sketcher(
                  lines: [line],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(3.0),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    RenderBox box = context.findRenderObject();
    Offset point = box.globalToLocal(details.globalPosition);
    line = DrawnLine([point], selectedColor, strokeWidth);
  }

  void onPanUpdate(DragUpdateDetails details) {
    RenderBox box = context.findRenderObject();
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.path)..add(point);
    line = DrawnLine(path, selectedColor, strokeWidth);
    currentLineStreamController.add(line);
  }

  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line);

    linesStreamController.add(lines);
  }

  Widget buildStrokeToolbar(screenHeight, screenWidth) {
    return Container(
      height: screenHeight * 10,
      width: screenWidth * 79,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Slider(
        min: 1.0,
        max: 25.0,
        label: "Stroke $strokeWidth",
        activeColor: selectedColor,
        value: strokeWidth,
        onChanged: (double value) {
          this.setState(() {
            strokeWidth = value;
          });
        },
      ),
    );
  }

  Widget buildColorToolbar(screenHeight, screenWidth) {
    return Container(
      width: screenWidth * 15,
      height: screenHeight * 87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(
            height: 50.0,
          ),
          buildSaveButton(),
          Divider(
            height: 20.0,
          ),
          buildColorButton(Colors.red),
          buildColorButton(Colors.blueAccent),
          buildColorButton(Colors.deepOrange),
          buildColorButton(Colors.green),
          buildColorButton(Colors.lightBlue),
          buildColorButton(Colors.black),
        ],
      ),
    );
  }

  Widget buildSaveButton() {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: CircleAvatar(
        child: Icon(
          Icons.save,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildColorButton(Color color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: color,
        child: Container(),
        onPressed: () {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  }

  Widget buildClearButton() {
    return GestureDetector(
      onTap: clear,
      child: CircleAvatar(
        child: Icon(
          Icons.create,
          size: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        _save();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Please Name your picture!'),
      content: TextField(
        onChanged: (value) {
          picturename = value;
        },
        decoration: InputDecoration(
          hintText: "Imaga Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.amber,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
