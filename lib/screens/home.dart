import 'package:alphabetgame/Arts/ObjectModels/house.dart';
import 'package:alphabetgame/Arts/drawing.dart';
import 'package:alphabetgame/Games/AlphabetBubbleGame.dart/AlphabetBubbleGame.dart';
import 'package:alphabetgame/Games/AlphabetBubbleGame.dart/UrduAlphabetBubbleGame.dart';
import 'package:alphabetgame/Games/MathTheColours.dart/MatchTheColorGame.dart';
import 'package:alphabetgame/General/constants.dart';
import 'package:alphabetgame/General/screen/DisplayItem.dart';
import 'package:alphabetgame/Mathematics/MathMenu.dart';
import 'package:alphabetgame/arubaid/ar.dart';
import 'package:alphabetgame/eng/word.dart';
import 'package:alphabetgame/science/Body.dart';
import 'package:just_audio/just_audio.dart';
import 'package:alphabetgame/science/ScienceStory.dart';
import 'package:alphabetgame/screens/alphabets.dart';
import 'package:alphabetgame/screens/colors.dart';
import 'package:alphabetgame/tracing/writing.dart';
import 'package:alphabetgame/widgets/DashboardCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _categories = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        color: Colors.purple[200],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/bubble.png"),
            child: Image.asset(
                "assets/Stickers/flower.png"), //alphabetgame\assets\Stickers\kidy.png
          ),
          title: Text(
            "Learn with Fun",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            "Exercises",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ),
    DashboardCard(
      sticker: "abc",
      subtitle: "with Sound",
      title: 'Learn Alphabets',
      primaryColor: Colors.pinkAccent[100],
      secondaryColor: Colors.pink[600],
      screen: AlphabetsScreen(
        id: 1,
        primaryColor: Colors.purpleAccent[100],
        secondaryColor: Colors.purple,
      ),
    ),
    DashboardCard(
      sticker: "abcd",
      subtitle: "Alphabets",
      title: 'Writing',
      primaryColor: Colors.lightGreenAccent,
      secondaryColor: Colors.green[900],
      screen: WritingScreen(),
    ),
    DashboardCard(
      sticker: "ab",
      subtitle: "Learn sentences",
      title: 'Phonics',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple[800],
      screen: WordScreen(),
    ),
    DashboardCard(
      sticker: "123",
      subtitle: "Addition Subtraction Sorting ",
      title: ' + > < -',
      primaryColor: Colors.blueAccent[100],
      secondaryColor: Colors.blue[900],
      screen: MathMenuScreen(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        color: Colors.brown, //
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/bubble.png"),
            child: Image.asset("assets/Stickers/birthday.png"),
          ),
          title: Text(
            "Fun Games",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            "Brainstorm",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ),
    DashboardCard(
      primaryColor: Colors.cyanAccent,
      secondaryColor: Colors.cyan[900],
      screen: AlphabetBubbleGame(),
      sticker: "abc",
      subtitle: "Pop the Alphabets",
      title: "Bubble Mania",
    ),
    DashboardCard(
      primaryColor: Colors.orangeAccent[100],
      secondaryColor: Colors.orange[900],
      screen: UrduAlphabetBubbleGame(),
      sticker: "urduGameSticker",
      subtitle: "Pop urdu Alphabets",
      title: "Bubble Mania",
    ),
    DashboardCard(
      primaryColor: Colors.lightGreenAccent[100],
      secondaryColor: Colors.lightGreen[900],
      screen: ColorGame(),
      sticker: "apple",
      subtitle: "Match the Colours",
      title: "Fruit Splash",
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        color: Colors.purple[800],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/bubble.png"),
            child: Image.asset("assets/Stickers/birthday.png"),
          ),
          title: Text(
            "General",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            "Brainstorm",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ),
    DashboardCard(
      primaryColor: Colors.tealAccent,
      secondaryColor: Colors.teal[900],
      screen: DisplayItemScreen(
        title: 'Animal',
        GeneralItemList: AnimalItemList,
      ),
      sticker: "parrot",
      subtitle: "with names",
      title: "Animals",
    ),
    DashboardCard(
      primaryColor: Colors.blueAccent[100],
      secondaryColor: Colors.blue[900],
      screen: DisplayItemScreen(
        title: 'Friuts',
        GeneralItemList: FiutsItemList,
      ),
      sticker: "mango",
      subtitle: "with names",
      title: "Friuts",
    ),
    DashboardCard(
      sticker: "book",
      subtitle: "with Names",
      title: 'Colors',
      primaryColor: Colors.orangeAccent[100],
      secondaryColor: Colors.orange,
      screen: ColorsScreen(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100],
        secondaryColor: Colors.orange,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        color: Colors.red[600],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/bubble.png"),
            child: Image.asset("assets/Stickers/birthday.png"),
          ),
          title: Text(
            "Science",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            "Brainstorm",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ),
    DashboardCard(
      primaryColor: Colors.blueAccent[100],
      secondaryColor: Colors.blueGrey,
      screen: ScienceStoryScreen(),
      sticker: "science",
      subtitle: "Scientific knowledge",
      title: "Science",
    ),
    DashboardCard(
      primaryColor: Colors.brown[200],
      secondaryColor: Colors.brown[900],
      screen: BodyScreen(),
      sticker: "body",
      subtitle: "3D view of Human Body",
      title: "Parts of Body",
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        color: Colors.lime[700],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/bubble.png"),
            child: Image.asset("assets/Stickers/birthday.png"),
          ),
          title: Text(
            "Arts",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            "Brainstorm",
            style: TextStyle(
                fontFamily: "GochiHand", color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ),
    DashboardCard(
      primaryColor: Colors.redAccent[100],
      secondaryColor: Colors.red,
      screen: DrawingScreen(),
      sticker: "art",
      subtitle: "Designing",
      title: "Drawing",
    ),
    DashboardCard(
      primaryColor: Colors.greenAccent,
      secondaryColor: Colors.green[800],
      screen: HouseScreen(),
      sticker: "color",
      subtitle: "Designing",
      title: "Coloring",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/7952759.jpg",
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50].withOpacity(0.3),
            image: DecorationImage(
              image: AssetImage('assets/images/bg-bottom.png'),
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 188.0,
                backgroundColor: Colors.grey[50].withOpacity(0.3),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/bg-top.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(_categories),
              ),
            ],
          ),
        ),
        BackMusicButton(),
      ]),
    );
  }
}

class BackMusicButton extends StatefulWidget {
  const BackMusicButton({
    Key key,
  }) : super(key: key);

  @override
  _BackMusicButtonState createState() => _BackMusicButtonState();
}

class _BackMusicButtonState extends State<BackMusicButton> {
  final player = AudioPlayer();
  bool flag = false;
  IconData iconVariable = Icons.music_video_sharp;
  @override
  Widget build(BuildContext context) {
    void initializeMusic() async {
      await player.setAsset(
        'assets/Music/back.mp3', //alphabetgame\assets\Music\back.mp3
      );

      await player.setVolume(5);

      await player.setLoopMode(LoopMode.one);

      await player.play();
    }

    return Positioned(
        top: 40,
        left: 10,
        child: IconButton(
            onPressed: () {
              if (flag == true) {
                setState(() {
                  initializeMusic();
                  iconVariable = Icons.music_off_sharp;
                  flag = false;
                });
              } else {
                setState(() {
                  player.stop();
                  iconVariable = Icons.music_video_sharp;
                  flag = true;
                });
              }
            },
            icon: Icon(
              iconVariable,
              color: Colors.deepOrange,
              size: 40.0,
            )));
  }
}
