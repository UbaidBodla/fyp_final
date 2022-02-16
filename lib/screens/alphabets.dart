import 'dart:convert';
import 'dart:async' show Future;
// import 'dart:typed_data';
import 'package:alphabetgame/entities/alphabet.dart';
import 'package:alphabetgame/helper.dart';
import 'package:alphabetgame/screens/counting.dart';
import 'package:alphabetgame/screens/home.dart';
import 'package:alphabetgame/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:just_audio/just_audio.dart';

//fetch urdu alphabets from the json data file.
Future<List<AlphabetEntity>> _fetchUrduAlphabets() async {
  String jsonString =
      await rootBundle.loadString('assets/data/urduAlphabets.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<AlphabetEntity>((json) => new AlphabetEntity.fromJson(json))
      .toList();
}

//fetch english alphabets from the json data file.
Future<List<AlphabetEntity>> _fetchEnglishAlphabets() async {
  String jsonString = await rootBundle.loadString('assets/data/alphabets.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<AlphabetEntity>((json) => new AlphabetEntity.fromJson(json))
      .toList();
}

class AlphabetsScreen extends StatefulWidget {
  final int id;
  final Color primaryColor;
  final Color secondaryColor;

  AlphabetsScreen({
    this.id,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _AlphabetsScreenState createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  Future<List<AlphabetEntity>> _alphabetsFuture;
  AudioPlayer player;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.id == 1) {
      _alphabetsFuture = _fetchEnglishAlphabets();
    }
    if (widget.id == 2) {
      _alphabetsFuture = _fetchUrduAlphabets();
    }

    player = AudioPlayer();
  }

  void _playAudio(String audioPath) async {
    await player.setAsset(audioPath);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          EditHeader(
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: _alphabetsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: TileCard(
                            isActive: _selectedIndex == index,
                            title: snapshot.data[index].text,
                            textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _playAudio(snapshot.data[index].audio);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }
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
        padding: EdgeInsets.only(left: 30, top: 60, right: 30),
        height: 300,
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
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
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
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            height: 80,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 4.0,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountingScreen(
                                        id: 1,
                                        primaryColor: Colors.greenAccent[100],
                                        secondaryColor: Colors.green,
                                      )),
                            );
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: 85,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "A",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 4.0,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlphabetsScreen(
                                        id: 1,
                                        primaryColor: Colors.purpleAccent[100],
                                        secondaryColor: Colors.purple,
                                      )),
                            );
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: 80,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "آ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 4.0,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlphabetsScreen(
                                        id: 2,
                                        primaryColor: Colors.pinkAccent[100],
                                        secondaryColor: Colors.pink,
                                      )),
                            );
                          },
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 0, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
