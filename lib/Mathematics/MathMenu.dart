import 'package:alphabetgame/Mathematics/Screens/arragments.dart';
import 'package:alphabetgame/widgets/DashboardCard.dart';
import 'package:alphabetgame/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'Screens/AdditionSubstractionScreen.dart';

class MathMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Media Query Variables: variables that defines the size of provieded screen and make screen responsive.
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      height: screenHeight * 100,
      width: screenWidth * 100,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PageHeader(
                  title: 'Math',
                  primaryColor: Colors.redAccent,
                  secondaryColor: Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Card(
                    color: Colors.purple[200],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/bubble.png"),
                        child: Image.asset("assets/Stickers/flower.png"),
                      ),
                      title: Text(
                        "Math",
                        style: TextStyle(
                            fontFamily: "GochiHand",
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        "Exercises",
                        style: TextStyle(
                            fontFamily: "GochiHand",
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      trailing: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                DashboardCard(
                  sticker: "numbers",
                  title: 'Addition',
                  subtitle: "Learn Addition",
                  primaryColor: Colors.pinkAccent[100],
                  secondaryColor: Colors.pink,
                  screen: AdditionSubstractionScreen(
                    title: 'learn Addtion',
                    sign: '+',
                  ),
                ),
                DashboardCard(
                  sticker: "numbers",
                  title: 'Substraction',
                  subtitle: "Learn Substraction",
                  primaryColor: Colors.greenAccent[100],
                  secondaryColor: Colors.green,
                  screen: AdditionSubstractionScreen(
                    title: 'Learn Substraction',
                    sign: '-',
                  ),
                ),
                DashboardCard(
                  sticker: "numbers",
                  title: 'Sorting',
                  subtitle: "Number Sorting",
                  primaryColor: Colors.deepOrangeAccent[100],
                  secondaryColor: Colors.deepOrange,
                  screen: ArrangeNumberScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Option Container: Container that display the options and navigate the screens.
class OptionContainer extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Widget screen;
  const OptionContainer(
      {Key key, this.text, this.screen, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/mathematics/qBtn.PNG"), //assets/mathematics/Banana.png
              fit: BoxFit.cover,
            ),
            color: Colors.green,
            border: Border.all(color: Colors.green, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(20) //
                ),
          ),
          height: height * 10,
          width: width * 70,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
