import 'dart:math';
import 'package:alphabetgame/tracing/alphabets/alphabets.dart';
import 'package:alphabetgame/tracing/signature_pad.dart';
import 'package:alphabetgame/widgets/page_header.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alphabet_clipper.dart';
import 'alphabet_painter.dart';

class WritingScreen extends StatefulWidget {
  //const writing({ Key? key }) : super(key: key);

  @override
  _WritingScreenState createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  String selectedText = "A";

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 12,
    penColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    exportBackgroundColor: Colors.blue,
  );
  @override
  //MessageBox(context);
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight * 100,
          width: screenWidth * 100,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              EditHeader(
                title: 'Writing',
                primaryColor: Colors.green,
                secondaryColor: Colors.green[700],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnContainer('assets/alphabets/1.png', Alpha_List,
                          screenHeight, screenWidth),
                      btnContainer('assets/number/1.jpg', number_List,
                          screenHeight, screenWidth),
                      btnContainer('assets/urduAlphabets/1.jpg', urdu_List,
                          screenHeight, screenWidth),
                    ],
                  ),
                  Container(
                    key: ValueKey<String>(selectedText),
                    height: screenHeight * 45,
                    width: screenWidth * 90,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                          247, 175, 82, 1), //rgb(247, 175, 82)rgb(252, 147, 0)
                      border: Border.all(
                          color: Color.fromRGBO(128, 35, 12, 1),
                          width: 15.0), //rgb(128, 35, 12)
                      //borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: SizedBox(
                      width: 600,
                      height: 600,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: CustomPaint(
                              size: Size(400, 400),
                              painter: getlocalpainter(),
                            ),
                          ),
                          Center(
                            child: ClipPath(
                              clipper: getlocalclipper(),
                              clipBehavior: Clip.hardEdge,
                              child: Signature(
                                controller: _controller,
                                width: 600,
                                height: 600,
                                backgroundColor: Colors.black.withOpacity(0.25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: currentList.length > 26
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      //controller: controller,
                      child: listofContainers(screenWidth, screenHeight),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnContainer(image, list, screenHeight, screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            border: Border.all(color: Colors.amber, width: 3.0),
            color: Colors.indigoAccent,
            // image: DecorationImage(
            //   image: AssetImage("assets/bubble.png"),
            // ),
          ),
          child: Center(
              child: Image.asset(
            '$image',
            height: 40,
          )),
        ),
        onTap: () {
          currentList = list;
          if (currentList.first.first == "A") {
            selectedText = "A";
          }
          if (currentList.first.first == "1") {
            selectedText = "1";
          }
          if (currentList.first.first == "u1") {
            selectedText = "u1";
          }
          _controller.clear();

          setState(() {});
        },
      ),
    );
  }

  Widget getCon(String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: AnimatedContainer(
          height: 70,
          width: 70,
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(300),
              // image: DecorationImage(
              //   image: AssetImage("assets/bubble.png"),
              // ),
              ),
          child: Center(
              child: Image.asset(
            '$image',
            //height: 40,
            fit: BoxFit.fitHeight,
          )),
        ),
        onTap: () {
          selectedText = text;
          _controller.clear();
          setState(() {});
        },
      ),
    );
  }

  Row listofContainers(screenWidth, screenHeight) {
    final List<Widget> rowList = [];
    for (int i = 0; i < currentList.length; i++) {
      rowList.addAll([
        getCon(
          currentList[i][1],
          currentList[i][0],
        ),
      ]);
    }

    final Row rowStars = Row(
      children: rowList,
    );

    return rowStars;
  }

  CustomPainter getlocalpainter() {
    return AlphabetPainter(getAlphabetsPainter(Size(300, 300))[selectedText]);
  }

  CustomClipper getlocalclipper() {
    return AlphabetClipper(
      getAlphabetClipper(Size(300, 300))[selectedText],
    );
  }
}

//var localpainter = getlocalpainter();

List<List<String>> currentList = Alpha_List;
const List<List<String>> Alpha_List = [
  ['A', 'assets/alphabets/1.png'],
  ['B', 'assets/alphabets/2.png'],
  ['C', 'assets/alphabets/3.png'],
  ['D', 'assets/alphabets/4.png'],
  ['E', 'assets/alphabets/5.png'],
  ['F', 'assets/alphabets/6.png'],
  ['G', 'assets/alphabets/7.png'],
  ['H', 'assets/alphabets/8.png'],
  ['I', 'assets/alphabets/9.png'],
  ['J', 'assets/alphabets/10.png'],
  ['K', 'assets/alphabets/11.png'],
  ['L', 'assets/alphabets/12.png'],
  ['M', 'assets/alphabets/13.png'],
  ['N', 'assets/alphabets/14.png'],
  ['O', 'assets/alphabets/15.png'],
  ['P', 'assets/alphabets/16.png'],
  ['Q', 'assets/alphabets/17.png'],
  ['R', 'assets/alphabets/18.png'],
  ['S', 'assets/alphabets/19.png'],
  ['T', 'assets/alphabets/20.png'],
  ['U', 'assets/alphabets/21.png'],
  ['V', 'assets/alphabets/22.png'],
  ['W', 'assets/alphabets/23.png'],
  ['X', 'assets/alphabets/24.png'],
  ['Y', 'assets/alphabets/25.png'],
  ['Z', 'assets/alphabets/26.png'],
];
const List<List<String>> number_List = [
  [
    '1',
    'assets/number/1.jpg',
    'Number1',
    'Number11'
  ], //alphabetgame\assets\number\1.jpg
  ['2', 'assets/number/2.jpg', 'Number2', 'Number22'],
  ['3', 'assets/number/3.jpg', '', ''],
  ['4', 'assets/number/4.jpg', '', ''],
  ['5', 'assets/number/5.jpg', '', ''],
  ['6', 'assets/number/6.jpg', '', ''],
  ['7', 'assets/number/7.jpg', '', ''],
  ['8', 'assets/number/8.jpg', '', ''],
  ['9', 'assets/number/9.jpg', '', ''],
  ['10', 'assets/number/10.jpg', '', ''],
];
const List<List<String>> urdu_List = [
  ['u1', 'assets/urduAlphabets/1.jpg', '', ''],
  ['u2', 'assets/urduAlphabets/2.jpg', '', ''],
  ['u3', 'assets/urduAlphabets/3.jpg', '', ''],
  ['', 'assets/urduAlphabets/4.jpg', '', ''],
  ['', 'assets/urduAlphabets/5.jpg', '', ''],
  ['', 'assets/urduAlphabets/6.jpg', '', ''],
  ['', 'assets/urduAlphabets/7.jpg', '', ''],
  ['', 'assets/urduAlphabets/8.jpg', '', ''],
  ['', 'assets/urduAlphabets/9.jpg', '', ''],
  ['', 'assets/urduAlphabets/10.jpg', '', ''],
  ['', 'assets/urduAlphabets/11.jpg', '', ''],
  ['', 'assets/urduAlphabets/12.jpg', '', ''],
  ['', 'assets/urduAlphabets/13.jpg', '', ''],
  ['', 'assets/urduAlphabets/14.jpg', '', ''],
  ['', 'assets/urduAlphabets/15.jpg', '', ''],
  ['', 'assets/urduAlphabets/16.jpg', '', ''],
  ['', 'assets/urduAlphabets/17.jpg', '', ''],
  ['', 'assets/urduAlphabets/18.jpg', '', ''],
  ['', 'assets/urduAlphabets/19.jpg', '', ''],
  ['', 'assets/urduAlphabets/20.jpg', '', ''],
  ['', 'assets/urduAlphabets/21.jpg', '', ''],
  ['', 'assets/urduAlphabets/22.jpg', '', ''],
  ['', 'assets/urduAlphabets/23.jpg', '', ''],
  ['', 'assets/urduAlphabets/24.jpg', '', ''],
  ['', 'assets/urduAlphabets/25.jpg', '', ''],
  ['', 'assets/urduAlphabets/26.jpg', '', ''],
  ['', 'assets/urduAlphabets/27.jpg', '', ''],
  ['', 'assets/urduAlphabets/28.jpg', '', ''],
  ['', 'assets/urduAlphabets/29.jpg', '', ''],
  ['', 'assets/urduAlphabets/30.jpg', '', ''],
  ['', 'assets/urduAlphabets/31.jpg', '', ''],
  ['', 'assets/urduAlphabets/32.jpg', '', ''],
  ['', 'assets/urduAlphabets/33.jpg', '', ''],
  ['', 'assets/urduAlphabets/34.jpg', '', ''],
  ['', 'assets/urduAlphabets/35.jpg', '', ''],
];

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    //animType: AnimType.BOTTOMSLIDE,
    title: 'Draw Alphabet',
    desc: 'Darw the alphabet by dragging it.',
    btnCancelText: "Got it",
    showCloseIcon: false,
    // btnCancelOnPress: () {
    //   //dispose();

    //   Navigator.pop(context);
    // },
  )..show();
}

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
