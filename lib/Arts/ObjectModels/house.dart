import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({Key key}) : super(key: key);

  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  GlobalKey _keyYellow = GlobalKey();
  //GlobalKey _keyRed = GlobalKey();
  Color color1 = Colors.white;
  Color firstcolor = Colors.white;
  Color secondcolor = Colors.white;
  Color thirdcolor = Colors.white;
  Color forthcolor = Colors.white;
  Color fifthcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Drawing"),
            IconButton(
              onPressed: () {
                firstcolor = Colors.white;
                secondcolor = Colors.white;
                thirdcolor = Colors.white;
                forthcolor = Colors.white;
                fifthcolor = Colors.white;
                setState(() {
                  super.widget;
                });
              },
              icon: Icon(
                Icons.restore_outlined,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image(
                      image: AssetImage(
                        'assets/house.jpeg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (color1 == Color.fromRGBO(247, 114, 114, 1)) {
                    firstcolor = color1;
                  } else if (color1 == Color.fromRGBO(249, 232, 215, 1)) {
                    secondcolor = color1;
                  } else if (color1 == Color.fromRGBO(193, 145, 103, 1)) {
                    thirdcolor = color1;
                  } else if (color1 == Color.fromRGBO(151, 228, 255, 1)) {
                    forthcolor = color1;
                  } else {
                    fifthcolor = Color.fromRGBO(137, 206, 148, 1);
                  }
                });
              },
              child: Container(
                height: 500,
                width: 500,
                color: Colors.grey,
                child: CustomPaint(
                  key: _keyYellow,
                  painter: HousePainter(firstcolor, secondcolor, thirdcolor,
                      forthcolor, fifthcolor),
                  child: Container(
                    height: 400,
                    width: 400,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Color.fromRGBO(247, 114, 114, 1);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(247, 114, 114, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Color.fromRGBO(249, 232, 215, 1);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(249, 232, 215, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Color.fromRGBO(193, 145, 103, 1);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(193, 145, 103, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Color.fromRGBO(151, 228, 255, 1);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(151, 228, 255, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color1 = Color.fromRGBO(137, 206, 148, 1);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(137, 206, 148, 1),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text('lamp')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 100,
                      color: Colors.teal,
                      child: Center(child: Text('Butterfly')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                    child: Center(child: Text('House')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//For House
class HousePainter extends CustomPainter {
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;

  HousePainter(this.color1, this.color2, this.color3, this.color4, this.color5);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = color1;
    // center of the canvas is (x,y) => (width/2, height/2)

    Paint paint0 = Paint();
    paint0.color = color1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4816667, size.height * 0.4728571);
    path0.lineTo(size.width * 0.6880000, size.height * 0.4762857);
    path0.lineTo(size.width * 0.6375000, size.height * 0.3328571);
    path0.lineTo(size.width * 0.4316667, size.height * 0.3314286);
    path0.lineTo(size.width * 0.4066667, size.height * 0.2914286);
    path0.lineTo(size.width * 0.3133333, size.height * 0.4514286);
    path0.lineTo(size.width * 0.3193333, size.height * 0.4674286);
    path0.lineTo(size.width * 0.4066667, size.height * 0.3185714);
    path0.lineTo(size.width * 0.4800000, size.height * 0.4428571);
    path0.lineTo(size.width * 0.4816667, size.height * 0.4728571);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint();
    paint1.color = color2;

    Path path1 = Path();
    path1.moveTo(size.width * 0.6533333, size.height * 0.6614286);
    path1.lineTo(size.width * 0.6566667, size.height * 0.6471429);
    path1.lineTo(size.width * 0.6608333, size.height * 0.6400000);
    path1.lineTo(size.width * 0.6633333, size.height * 0.6342857);
    path1.lineTo(size.width * 0.6683333, size.height * 0.6285714);
    path1.lineTo(size.width * 0.6700000, size.height * 0.4771429);
    path1.lineTo(size.width * 0.4816667, size.height * 0.4757143);
    path1.lineTo(size.width * 0.4816667, size.height * 0.6628571);
    path1.lineTo(size.width * 0.5008333, size.height * 0.6628571);
    path1.lineTo(size.width * 0.5691667, size.height * 0.6628571);
    path1.lineTo(size.width * 0.5791667, size.height * 0.6485714);
    path1.lineTo(size.width * 0.5841667, size.height * 0.6371429);
    path1.lineTo(size.width * 0.5925000, size.height * 0.6400000);
    path1.lineTo(size.width * 0.6016667, size.height * 0.6300000);
    path1.lineTo(size.width * 0.6116667, size.height * 0.6371429);
    path1.lineTo(size.width * 0.6200000, size.height * 0.6342857);
    path1.lineTo(size.width * 0.6250000, size.height * 0.6428571);
    path1.lineTo(size.width * 0.6325000, size.height * 0.6428571);
    path1.lineTo(size.width * 0.6358333, size.height * 0.6514286);
    path1.lineTo(size.width * 0.6441667, size.height * 0.6614286);
    path1.lineTo(size.width * 0.6533333, size.height * 0.6614286);
    path1.close();

    canvas.drawPath(path1, paint1);

    Path path2 = Path();
    path2.moveTo(size.width * 0.4816667, size.height * 0.6614286);
    path2.lineTo(size.width * 0.3866667, size.height * 0.6642857);
    path2.lineTo(size.width * 0.3833333, size.height * 0.6542857);
    path2.lineTo(size.width * 0.3791667, size.height * 0.6471429);
    path2.lineTo(size.width * 0.3725000, size.height * 0.6428571);
    path2.lineTo(size.width * 0.3683333, size.height * 0.6314286);
    path2.lineTo(size.width * 0.3600000, size.height * 0.6314286);
    path2.lineTo(size.width * 0.3533333, size.height * 0.6285714);
    path2.lineTo(size.width * 0.3475000, size.height * 0.6314286);
    path2.lineTo(size.width * 0.3375000, size.height * 0.6342857);
    path2.lineTo(size.width * 0.3333333, size.height * 0.6342857);
    path2.lineTo(size.width * 0.3325000, size.height * 0.4442857);
    path2.lineTo(size.width * 0.4058333, size.height * 0.3200000);
    path2.lineTo(size.width * 0.4800000, size.height * 0.4400000);
    path2.lineTo(size.width * 0.4816667, size.height * 0.6614286);
    path2.close();

    canvas.drawPath(path2, paint1);

    Paint paint3 = Paint();
    paint3.color = color3;

    Path path3 = Path();
    path3.moveTo(size.width * 0.5575000, size.height * 0.6614286);
    path3.lineTo(size.width * 0.5583333, size.height * 0.6528571);
    path3.lineTo(size.width * 0.5525000, size.height * 0.6514286);
    path3.lineTo(size.width * 0.5525000, size.height * 0.5200000);
    path3.lineTo(size.width * 0.5075000, size.height * 0.5185714);
    path3.lineTo(size.width * 0.5075000, size.height * 0.6485714);
    path3.lineTo(size.width * 0.5016667, size.height * 0.6514286);
    path3.lineTo(size.width * 0.5000000, size.height * 0.6614286);
    path3.lineTo(size.width * 0.5575000, size.height * 0.6614286);
    path3.close();

    canvas.drawPath(path3, paint3);

    Paint paint4 = Paint();
    paint4.color = color4;

    Path path4 = Path();
    path4.moveTo(size.width * 0.6408333, size.height * 0.5871429);
    path4.lineTo(size.width * 0.6416667, size.height * 0.5142857);
    path4.lineTo(size.width * 0.6116667, size.height * 0.5114286);
    path4.lineTo(size.width * 0.6110000, size.height * 0.5885714);
    path4.lineTo(size.width * 0.5816667, size.height * 0.5885714);
    path4.lineTo(size.width * 0.5825000, size.height * 0.5142857);
    path4.lineTo(size.width * 0.6113333, size.height * 0.5134286);
    path4.lineTo(size.width * 0.6121667, size.height * 0.5874286);
    path4.lineTo(size.width * 0.6408333, size.height * 0.5871429);
    path4.close();

    canvas.drawPath(path4, paint4);

    Path path5 = Path();
    path5.moveTo(size.width * 0.4516667, size.height * 0.5900000);
    path5.lineTo(size.width * 0.4508333, size.height * 0.5100000);
    path5.lineTo(size.width * 0.4225000, size.height * 0.5100000);
    path5.lineTo(size.width * 0.4233333, size.height * 0.5928571);
    path5.lineTo(size.width * 0.3911667, size.height * 0.5920000);
    path5.lineTo(size.width * 0.3908333, size.height * 0.5125714);
    path5.lineTo(size.width * 0.4220000, size.height * 0.5108571);
    path5.lineTo(size.width * 0.3633333, size.height * 0.5114286);
    path5.lineTo(size.width * 0.3616667, size.height * 0.5900000);
    path5.lineTo(size.width * 0.4516667, size.height * 0.5900000);
    path5.close();

    canvas.drawPath(path5, paint4);

    Path path6 = Path();
    path6.moveTo(size.width * 0.4266667, size.height * 0.4371429);
    path6.lineTo(size.width * 0.4275000, size.height * 0.3800000);
    path6.lineTo(size.width * 0.4075000, size.height * 0.3800000);
    path6.lineTo(size.width * 0.4066667, size.height * 0.4114286);
    path6.lineTo(size.width * 0.4266667, size.height * 0.4111429);
    path6.lineTo(size.width * 0.3875000, size.height * 0.4100000);
    path6.lineTo(size.width * 0.3866667, size.height * 0.3814286);
    path6.lineTo(size.width * 0.4063333, size.height * 0.3822857);
    path6.lineTo(size.width * 0.4066667, size.height * 0.4414286);
    path6.lineTo(size.width * 0.3866667, size.height * 0.4371429);
    path6.lineTo(size.width * 0.3870000, size.height * 0.4111429);
    path6.lineTo(size.width * 0.4068333, size.height * 0.4120000);
    path6.lineTo(size.width * 0.4073333, size.height * 0.4394286);
    path6.lineTo(size.width * 0.4271667, size.height * 0.4382857);

    canvas.drawPath(path6, paint4);

    Paint paint5 = Paint();
    paint5.color = color5;
    Path path7 = Path();
    path7.moveTo(size.width * 0.6866667, size.height * 0.6657143);
    path7.lineTo(size.width * 0.6816667, size.height * 0.6514286);
    path7.lineTo(size.width * 0.6816667, size.height * 0.6385714);
    path7.lineTo(size.width * 0.6733333, size.height * 0.6371429);
    path7.lineTo(size.width * 0.6641667, size.height * 0.6357143);
    path7.lineTo(size.width * 0.6575000, size.height * 0.6457143);
    path7.lineTo(size.width * 0.6558333, size.height * 0.6571429);
    path7.lineTo(size.width * 0.6566667, size.height * 0.6714286);
    path7.lineTo(size.width * 0.6641667, size.height * 0.6714286);
    path7.lineTo(size.width * 0.6683333, size.height * 0.6742857);
    path7.lineTo(size.width * 0.6766667, size.height * 0.6700000);
    path7.lineTo(size.width * 0.6866667, size.height * 0.6657143);
    path7.close();

    canvas.drawPath(path7, paint5);

    Path path8 = Path();
    path8.moveTo(size.width * 0.6190000, size.height * 0.6814286);
    path8.lineTo(size.width * 0.6291667, size.height * 0.6800000);
    path8.lineTo(size.width * 0.6350000, size.height * 0.6757143);
    path8.lineTo(size.width * 0.6425000, size.height * 0.6728571);
    path8.lineTo(size.width * 0.6441667, size.height * 0.6600000);
    path8.lineTo(size.width * 0.6358333, size.height * 0.6500000);
    path8.lineTo(size.width * 0.6333333, size.height * 0.6414286);
    path8.lineTo(size.width * 0.6266667, size.height * 0.6442857);
    path8.lineTo(size.width * 0.6200000, size.height * 0.6328571);
    path8.lineTo(size.width * 0.6133333, size.height * 0.6357143);
    path8.lineTo(size.width * 0.6016667, size.height * 0.6300000);
    path8.lineTo(size.width * 0.5933333, size.height * 0.6400000);
    path8.lineTo(size.width * 0.5841667, size.height * 0.6371429);
    path8.lineTo(size.width * 0.5766667, size.height * 0.6514286);
    path8.lineTo(size.width * 0.5700000, size.height * 0.6671429);
    path8.lineTo(size.width * 0.5733333, size.height * 0.6714286);
    path8.lineTo(size.width * 0.5808333, size.height * 0.6800000);
    path8.lineTo(size.width * 0.5883333, size.height * 0.6800000);
    path8.lineTo(size.width * 0.5941667, size.height * 0.6800000);
    path8.lineTo(size.width * 0.6008333, size.height * 0.6800000);
    path8.lineTo(size.width * 0.6083333, size.height * 0.6828571);
    path8.lineTo(size.width * 0.6190000, size.height * 0.6814286);
    path8.close();

    canvas.drawPath(path8, paint5);

    Path path9 = Path();
    path9.moveTo(size.width * 0.3866667, size.height * 0.6671429);
    path9.lineTo(size.width * 0.3825000, size.height * 0.6771429);
    path9.lineTo(size.width * 0.3783333, size.height * 0.6814286);
    path9.lineTo(size.width * 0.3716667, size.height * 0.6814286);
    path9.lineTo(size.width * 0.3658333, size.height * 0.6814286);
    path9.lineTo(size.width * 0.3625000, size.height * 0.6814286);
    path9.lineTo(size.width * 0.3566667, size.height * 0.6842857);
    path9.lineTo(size.width * 0.3466667, size.height * 0.6842857);
    path9.lineTo(size.width * 0.3366667, size.height * 0.6842857);
    path9.lineTo(size.width * 0.3283333, size.height * 0.6842857);
    path9.lineTo(size.width * 0.3183333, size.height * 0.6757143);
    path9.lineTo(size.width * 0.3133333, size.height * 0.6657143);
    path9.lineTo(size.width * 0.3183333, size.height * 0.6514286);
    path9.lineTo(size.width * 0.3233333, size.height * 0.6500000);
    path9.lineTo(size.width * 0.3258333, size.height * 0.6371429);
    path9.lineTo(size.width * 0.3350000, size.height * 0.6371429);
    path9.lineTo(size.width * 0.3416667, size.height * 0.6300000);
    path9.lineTo(size.width * 0.3525000, size.height * 0.6300000);
    path9.lineTo(size.width * 0.3591667, size.height * 0.6328571);
    path9.lineTo(size.width * 0.3683333, size.height * 0.6371429);
    path9.lineTo(size.width * 0.3783333, size.height * 0.6500000);
    path9.lineTo(size.width * 0.3841667, size.height * 0.6557143);
    path9.lineTo(size.width * 0.3866667, size.height * 0.6671429);
    path9.close();

    canvas.drawPath(path9, paint5);

    Path path10 = Path();
    path10.moveTo(size.width * 0.6050000, size.height * 0.3300000);
    path10.lineTo(size.width * 0.6058333, size.height * 0.3151429);
    path10.lineTo(size.width * 0.5850000, size.height * 0.3142857);
    path10.lineTo(size.width * 0.5840000, size.height * 0.2980000);
    path10.lineTo(size.width * 0.6081667, size.height * 0.2977143);
    path10.lineTo(size.width * 0.6091667, size.height * 0.3131429);
    path10.lineTo(size.width * 0.5851667, size.height * 0.3142857);
    path10.lineTo(size.width * 0.5833333, size.height * 0.3285714);
    path10.lineTo(size.width * 0.6050000, size.height * 0.3300000);
    path10.close();

    canvas.drawPath(path10, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
