import 'dart:core';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButterflyScreen extends StatefulWidget {
  const ButterflyScreen({Key key}) : super(key: key);

  @override
  _ButterflyScreenState createState() => _ButterflyScreenState();
}

class _ButterflyScreenState extends State<ButterflyScreen> {
  GlobalKey _keyYellow = GlobalKey();
  //GlobalKey _keyRed = GlobalKey();
  Color color1 = Colors.white;
  Color firstcolor = Colors.white;
  Color secondcolor = Colors.white;
  Color thirdcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pint the Butterfly"),
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
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (color1 == Colors.green) {
                      firstcolor = color1;
                    }
                    if (color1 == Colors.red) {
                      firstcolor = color1;
                    } else if (color1 == Color.fromRGBO(159, 71, 159, 1)) {
                      secondcolor = color1;
                    } else {
                      thirdcolor = Color.fromRGBO(124, 201, 224, 1);
                    }
                  });
                },
                child: Container(
                  height: screenHeight * 60,
                  width: screenWidth * 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 8),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueGrey, //rgb(19, 38, 214)
                  ),
                  child: CustomPaint(
                    key: _keyYellow,
                    painter: ShapesPainter(firstcolor, secondcolor, thirdcolor),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionColorBox(Colors.green),
                  OptionColorBox(Colors.red),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = Color.fromRGBO(159, 71, 159, 1);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(159, 71, 159, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = Color.fromRGBO(124, 201, 224, 1);
                      });
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(124, 201, 224, 1),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector OptionColorBox(color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color1 = color;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

//For Butterfly
class ShapesPainter extends CustomPainter {
  Color color1;
  Color color2;
  Color color3;
  ShapesPainter(this.color1, this.color2, this.color3);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = color1;
    // center of the canvas is (x,y) => (width/2, height/2)

    Path path0 = Path();
    path0.moveTo(size.width * 0.5191667, size.height * 0.4528571);
    path0.lineTo(size.width * 0.5466667, size.height * 0.3857143);
    path0.lineTo(size.width * 0.5733333, size.height * 0.3385714);
    path0.lineTo(size.width * 0.6116667, size.height * 0.2800000);
    path0.lineTo(size.width * 0.6483333, size.height * 0.2428571);
    path0.lineTo(size.width * 0.6925000, size.height * 0.2071429);
    path0.lineTo(size.width * 0.7606667, size.height * 0.1768571);
    path0.lineTo(size.width * 0.7941667, size.height * 0.1845714);
    path0.lineTo(size.width * 0.8046667, size.height * 0.2037143);
    path0.lineTo(size.width * 0.8048333, size.height * 0.2214286);
    path0.lineTo(size.width * 0.8041667, size.height * 0.2414286);
    path0.lineTo(size.width * 0.7950000, size.height * 0.2800000);
    path0.lineTo(size.width * 0.7625000, size.height * 0.3285714);
    path0.lineTo(size.width * 0.7708333, size.height * 0.3557143);
    path0.lineTo(size.width * 0.7666667, size.height * 0.3842857);
    path0.lineTo(size.width * 0.7575000, size.height * 0.4114286);
    path0.lineTo(size.width * 0.7450000, size.height * 0.4271429);
    path0.lineTo(size.width * 0.7358333, size.height * 0.4442857);
    path0.lineTo(size.width * 0.7358333, size.height * 0.4700000);
    path0.lineTo(size.width * 0.7258333, size.height * 0.4957143);
    path0.lineTo(size.width * 0.7133333, size.height * 0.5114286);
    path0.lineTo(size.width * 0.7008333, size.height * 0.5257143);
    path0.lineTo(size.width * 0.6858333, size.height * 0.5314286);
    path0.lineTo(size.width * 0.6833333, size.height * 0.5385714);
    path0.lineTo(size.width * 0.6958333, size.height * 0.5514286);
    path0.lineTo(size.width * 0.7133333, size.height * 0.5800000);
    path0.lineTo(size.width * 0.7200000, size.height * 0.6142857);
    path0.lineTo(size.width * 0.7183333, size.height * 0.6442857);
    path0.lineTo(size.width * 0.7150000, size.height * 0.6640000);
    path0.lineTo(size.width * 0.7183333, size.height * 0.6828571);
    path0.lineTo(size.width * 0.7175000, size.height * 0.7000000);
    path0.lineTo(size.width * 0.7150000, size.height * 0.7142857);
    path0.lineTo(size.width * 0.7066667, size.height * 0.7342857);
    path0.lineTo(size.width * 0.6915000, size.height * 0.7611429);
    path0.lineTo(size.width * 0.6875000, size.height * 0.7857143);
    path0.lineTo(size.width * 0.6816667, size.height * 0.7957143);
    path0.lineTo(size.width * 0.6666667, size.height * 0.8114286);
    path0.lineTo(size.width * 0.6541667, size.height * 0.8342857);
    path0.lineTo(size.width * 0.6300000, size.height * 0.8428571);
    path0.lineTo(size.width * 0.6058333, size.height * 0.8385714);
    path0.lineTo(size.width * 0.5833333, size.height * 0.8128571);
    path0.lineTo(size.width * 0.5558333, size.height * 0.7557143);
    path0.lineTo(size.width * 0.5400000, size.height * 0.6985714);
    path0.lineTo(size.width * 0.5300000, size.height * 0.6657143);
    path0.lineTo(size.width * 0.5250000, size.height * 0.6400000);
    path0.lineTo(size.width * 0.5491667, size.height * 0.6942857);
    path0.lineTo(size.width * 0.5716667, size.height * 0.7514286);
    path0.lineTo(size.width * 0.5950000, size.height * 0.7785714);
    path0.lineTo(size.width * 0.6061667, size.height * 0.7897143);
    path0.lineTo(size.width * 0.6250000, size.height * 0.7885714);
    path0.lineTo(size.width * 0.6305000, size.height * 0.7660000);
    path0.lineTo(size.width * 0.6508333, size.height * 0.7600000);
    path0.lineTo(size.width * 0.6633333, size.height * 0.7528571);
    path0.lineTo(size.width * 0.6691667, size.height * 0.7442857);
    path0.lineTo(size.width * 0.6725000, size.height * 0.7285714);
    path0.lineTo(size.width * 0.6733333, size.height * 0.7142857);
    path0.lineTo(size.width * 0.6708333, size.height * 0.6928571);
    path0.lineTo(size.width * 0.6825000, size.height * 0.6885714);
    path0.lineTo(size.width * 0.6908333, size.height * 0.6757143);
    path0.lineTo(size.width * 0.6966667, size.height * 0.6542857);
    path0.lineTo(size.width * 0.6991667, size.height * 0.6342857);
    path0.lineTo(size.width * 0.6950000, size.height * 0.6171429);
    path0.lineTo(size.width * 0.6850000, size.height * 0.5957143);
    path0.lineTo(size.width * 0.6700000, size.height * 0.5814286);
    path0.lineTo(size.width * 0.6533333, size.height * 0.5714286);
    path0.lineTo(size.width * 0.6308333, size.height * 0.5642857);
    path0.lineTo(size.width * 0.5983333, size.height * 0.5514286);
    path0.lineTo(size.width * 0.5841667, size.height * 0.5500000);
    path0.lineTo(size.width * 0.5700000, size.height * 0.5457143);
    path0.lineTo(size.width * 0.5458333, size.height * 0.5457143);
    path0.lineTo(size.width * 0.5283333, size.height * 0.5457143);
    path0.lineTo(size.width * 0.5275000, size.height * 0.5157143);
    path0.lineTo(size.width * 0.5383333, size.height * 0.5171429);
    path0.lineTo(size.width * 0.5533333, size.height * 0.5171429);
    path0.lineTo(size.width * 0.5816667, size.height * 0.5157143);
    path0.lineTo(size.width * 0.6141667, size.height * 0.5085714);
    path0.lineTo(size.width * 0.6416667, size.height * 0.5028571);
    path0.lineTo(size.width * 0.6741667, size.height * 0.4928571);
    path0.lineTo(size.width * 0.7016667, size.height * 0.4785714);
    path0.lineTo(size.width * 0.7116667, size.height * 0.4614286);
    path0.lineTo(size.width * 0.7133333, size.height * 0.4414286);
    path0.lineTo(size.width * 0.7075000, size.height * 0.4197143);
    path0.lineTo(size.width * 0.7216667, size.height * 0.4028571);
    path0.lineTo(size.width * 0.7325000, size.height * 0.3900000);
    path0.lineTo(size.width * 0.7391667, size.height * 0.3714286);
    path0.lineTo(size.width * 0.7366667, size.height * 0.3542857);
    path0.lineTo(size.width * 0.7308333, size.height * 0.3428571);
    path0.lineTo(size.width * 0.7075000, size.height * 0.3342857);
    path0.lineTo(size.width * 0.7300000, size.height * 0.3214286);
    path0.lineTo(size.width * 0.7425000, size.height * 0.3057143);
    path0.lineTo(size.width * 0.7491667, size.height * 0.2771429);
    path0.lineTo(size.width * 0.7425000, size.height * 0.2528571);
    path0.lineTo(size.width * 0.7283333, size.height * 0.2428571);
    path0.lineTo(size.width * 0.7183333, size.height * 0.2428571);
    path0.lineTo(size.width * 0.7066667, size.height * 0.2500000);
    path0.lineTo(size.width * 0.6841667, size.height * 0.2628571);
    path0.lineTo(size.width * 0.6700000, size.height * 0.2757143);
    path0.lineTo(size.width * 0.6533333, size.height * 0.2885714);
    path0.lineTo(size.width * 0.6341667, size.height * 0.3057143);
    path0.lineTo(size.width * 0.6191667, size.height * 0.3257143);
    path0.lineTo(size.width * 0.6033333, size.height * 0.3457143);
    path0.lineTo(size.width * 0.5866667, size.height * 0.3714286);
    path0.lineTo(size.width * 0.5708333, size.height * 0.4014286);
    path0.lineTo(size.width * 0.5533333, size.height * 0.4300000);
    path0.lineTo(size.width * 0.5416667, size.height * 0.4585714);
    path0.lineTo(size.width * 0.5358333, size.height * 0.4714286);
    path0.lineTo(size.width * 0.5333333, size.height * 0.4857143);
    path0.lineTo(size.width * 0.5291667, size.height * 0.4985714);
    path0.lineTo(size.width * 0.5266667, size.height * 0.4757143);
    path0.lineTo(size.width * 0.5191667, size.height * 0.4528571);
    path0.close();

    canvas.drawPath(path0, paint);

    Path path1 = Path();
    path1.moveTo(size.width * 0.4916667, size.height * 0.6514286);
    path1.lineTo(size.width * 0.4816667, size.height * 0.6857143);
    path1.lineTo(size.width * 0.4733333, size.height * 0.7171429);
    path1.lineTo(size.width * 0.4650000, size.height * 0.7557143);
    path1.lineTo(size.width * 0.4516667, size.height * 0.8042857);
    path1.quadraticBezierTo(size.width * 0.4384167, size.height * 0.8231429,
        size.width * 0.4340000, size.height * 0.8294286);
    path1.quadraticBezierTo(size.width * 0.4302917, size.height * 0.8320714,
        size.width * 0.4191667, size.height * 0.8400000);
    path1.lineTo(size.width * 0.4066667, size.height * 0.8385714);
    path1.lineTo(size.width * 0.3966667, size.height * 0.8357143);
    path1.lineTo(size.width * 0.3891667, size.height * 0.8300000);
    path1.lineTo(size.width * 0.3800000, size.height * 0.8200000);
    path1.lineTo(size.width * 0.3683333, size.height * 0.8142857);
    path1.lineTo(size.width * 0.3583333, size.height * 0.8028571);
    path1.lineTo(size.width * 0.3483333, size.height * 0.7857143);
    path1.lineTo(size.width * 0.3350000, size.height * 0.7728571);
    path1.lineTo(size.width * 0.3208333, size.height * 0.7542857);
    path1.lineTo(size.width * 0.3141667, size.height * 0.7385714);
    path1.lineTo(size.width * 0.3141667, size.height * 0.7214286);
    path1.lineTo(size.width * 0.3066667, size.height * 0.7000000);
    path1.lineTo(size.width * 0.3016667, size.height * 0.6642857);
    path1.lineTo(size.width * 0.3016667, size.height * 0.6414286);
    path1.lineTo(size.width * 0.3133333, size.height * 0.5942857);
    path1.lineTo(size.width * 0.3216667, size.height * 0.5771429);
    path1.lineTo(size.width * 0.3483333, size.height * 0.5442857);
    path1.quadraticBezierTo(size.width * 0.3293333, size.height * 0.5406429,
        size.width * 0.3230000, size.height * 0.5394286);
    path1.quadraticBezierTo(size.width * 0.3197500, size.height * 0.5374286,
        size.width * 0.3100000, size.height * 0.5314286);
    path1.lineTo(size.width * 0.2991667, size.height * 0.5185714);
    path1.lineTo(size.width * 0.2950000, size.height * 0.5042857);
    path1.lineTo(size.width * 0.2891667, size.height * 0.4814286);
    path1.lineTo(size.width * 0.2916667, size.height * 0.4600000);
    path1.lineTo(size.width * 0.2783333, size.height * 0.4400000);
    path1.lineTo(size.width * 0.2691667, size.height * 0.4242857);
    path1.lineTo(size.width * 0.2616667, size.height * 0.3985714);
    path1.lineTo(size.width * 0.2566667, size.height * 0.3628571);
    path1.lineTo(size.width * 0.2458333, size.height * 0.3457143);
    path1.lineTo(size.width * 0.2275000, size.height * 0.3214286);
    path1.lineTo(size.width * 0.2233333, size.height * 0.3000000);
    path1.lineTo(size.width * 0.2200000, size.height * 0.2828571);
    path1.lineTo(size.width * 0.2250000, size.height * 0.2642857);
    path1.lineTo(size.width * 0.2341667, size.height * 0.2471429);
    path1.lineTo(size.width * 0.2650000, size.height * 0.2357143);
    path1.lineTo(size.width * 0.2841667, size.height * 0.2342857);
    path1.lineTo(size.width * 0.3008333, size.height * 0.2371429);
    path1.lineTo(size.width * 0.3233333, size.height * 0.2471429);
    path1.lineTo(size.width * 0.3608333, size.height * 0.2700000);
    path1.lineTo(size.width * 0.3933333, size.height * 0.3028571);
    path1.lineTo(size.width * 0.4166667, size.height * 0.3300000);
    path1.lineTo(size.width * 0.4366667, size.height * 0.3585714);
    path1.lineTo(size.width * 0.4508333, size.height * 0.3771429);
    path1.lineTo(size.width * 0.4733333, size.height * 0.4128571);
    path1.lineTo(size.width * 0.4883333, size.height * 0.4442857);
    path1.lineTo(size.width * 0.4933333, size.height * 0.4614286);
    path1.lineTo(size.width * 0.4875000, size.height * 0.4742857);
    path1.lineTo(size.width * 0.4816667, size.height * 0.4714286);
    path1.lineTo(size.width * 0.4691667, size.height * 0.4514286);
    path1.lineTo(size.width * 0.4458333, size.height * 0.4157143);
    path1.lineTo(size.width * 0.4108333, size.height * 0.3700000);
    path1.lineTo(size.width * 0.3866667, size.height * 0.3442857);
    path1.lineTo(size.width * 0.3566667, size.height * 0.3214286);
    path1.lineTo(size.width * 0.3241667, size.height * 0.3071429);
    path1.lineTo(size.width * 0.3083333, size.height * 0.3057143);
    path1.lineTo(size.width * 0.2866667, size.height * 0.3185714);
    path1.lineTo(size.width * 0.2816667, size.height * 0.3314286);
    path1.lineTo(size.width * 0.2858333, size.height * 0.3514286);
    path1.lineTo(size.width * 0.2975000, size.height * 0.3771429);
    path1.lineTo(size.width * 0.3025000, size.height * 0.3857143);
    path1.lineTo(size.width * 0.2950000, size.height * 0.3928571);
    path1.lineTo(size.width * 0.2908333, size.height * 0.4128571);
    path1.lineTo(size.width * 0.2950000, size.height * 0.4271429);
    path1.lineTo(size.width * 0.3066667, size.height * 0.4428571);
    path1.lineTo(size.width * 0.3183333, size.height * 0.4571429);
    path1.lineTo(size.width * 0.3166667, size.height * 0.4800000);
    path1.lineTo(size.width * 0.3216667, size.height * 0.5000000);
    path1.lineTo(size.width * 0.3300000, size.height * 0.5114286);
    path1.lineTo(size.width * 0.3441667, size.height * 0.5171429);
    path1.lineTo(size.width * 0.3633333, size.height * 0.5242857);
    path1.lineTo(size.width * 0.3833333, size.height * 0.5171429);
    path1.lineTo(size.width * 0.4000000, size.height * 0.5200000);
    path1.lineTo(size.width * 0.4138333, size.height * 0.5251429);
    path1.lineTo(size.width * 0.4325000, size.height * 0.5185714);
    path1.lineTo(size.width * 0.4466667, size.height * 0.5185714);
    path1.lineTo(size.width * 0.4600000, size.height * 0.5185714);
    path1.lineTo(size.width * 0.4733333, size.height * 0.5185714);
    path1.lineTo(size.width * 0.4766667, size.height * 0.5185714);
    path1.lineTo(size.width * 0.4841667, size.height * 0.5171429);
    path1.lineTo(size.width * 0.4866667, size.height * 0.5371429);
    path1.lineTo(size.width * 0.4650000, size.height * 0.5385714);
    path1.lineTo(size.width * 0.4316667, size.height * 0.5485714);
    path1.lineTo(size.width * 0.4183333, size.height * 0.5600000);
    path1.lineTo(size.width * 0.4091667, size.height * 0.5600000);
    path1.lineTo(size.width * 0.3900000, size.height * 0.5685714);
    path1.lineTo(size.width * 0.3616667, size.height * 0.5857143);
    path1.lineTo(size.width * 0.3425000, size.height * 0.5985714);
    path1.lineTo(size.width * 0.3266667, size.height * 0.6300000);
    path1.lineTo(size.width * 0.3241667, size.height * 0.6742857);
    path1.lineTo(size.width * 0.3300000, size.height * 0.6914286);
    path1.lineTo(size.width * 0.3466667, size.height * 0.7042857);
    path1.lineTo(size.width * 0.3425000, size.height * 0.7371429);
    path1.lineTo(size.width * 0.3525000, size.height * 0.7571429);
    path1.lineTo(size.width * 0.3675000, size.height * 0.7657143);
    path1.lineTo(size.width * 0.3750000, size.height * 0.7642857);
    path1.lineTo(size.width * 0.3866667, size.height * 0.7614286);
    path1.lineTo(size.width * 0.3916667, size.height * 0.7571429);
    path1.lineTo(size.width * 0.4008333, size.height * 0.7828571);
    path1.lineTo(size.width * 0.4183333, size.height * 0.7971429);
    path1.lineTo(size.width * 0.4333333, size.height * 0.7942857);
    path1.lineTo(size.width * 0.4425000, size.height * 0.7771429);
    path1.lineTo(size.width * 0.4533333, size.height * 0.7528571);
    path1.lineTo(size.width * 0.4616667, size.height * 0.7171429);
    path1.lineTo(size.width * 0.4716667, size.height * 0.6857143);
    path1.lineTo(size.width * 0.4766667, size.height * 0.6642857);
    path1.lineTo(size.width * 0.4841667, size.height * 0.6457143);
    path1.lineTo(size.width * 0.4900000, size.height * 0.6314286);
    path1.lineTo(size.width * 0.4916667, size.height * 0.6514286);
    path1.close();

    canvas.drawPath(path1, paint);

    Paint paint2 = Paint();
    paint2.color = color2;
    Path path2 = Path();
    path2.moveTo(size.width * 0.5283333, size.height * 0.4971429);
    path2.lineTo(size.width * 0.5358333, size.height * 0.4700000);
    path2.lineTo(size.width * 0.5475000, size.height * 0.4400000);
    path2.lineTo(size.width * 0.5600000, size.height * 0.4157143);
    path2.lineTo(size.width * 0.5741667, size.height * 0.3971429);
    path2.lineTo(size.width * 0.6033333, size.height * 0.3471429);
    path2.lineTo(size.width * 0.6266667, size.height * 0.3185714);
    path2.lineTo(size.width * 0.6433333, size.height * 0.3000000);
    path2.lineTo(size.width * 0.6808333, size.height * 0.2685714);
    path2.lineTo(size.width * 0.6983333, size.height * 0.2557143);
    path2.lineTo(size.width * 0.7241667, size.height * 0.2471429);
    path2.lineTo(size.width * 0.7400000, size.height * 0.2514286);
    path2.lineTo(size.width * 0.7450000, size.height * 0.2728571);
    path2.lineTo(size.width * 0.7450000, size.height * 0.2900000);
    path2.lineTo(size.width * 0.7375000, size.height * 0.3071429);
    path2.lineTo(size.width * 0.7300000, size.height * 0.3171429);
    path2.lineTo(size.width * 0.7191667, size.height * 0.3328571);
    path2.lineTo(size.width * 0.7116667, size.height * 0.3371429);
    path2.lineTo(size.width * 0.7216667, size.height * 0.3428571);
    path2.lineTo(size.width * 0.7266667, size.height * 0.3457143);
    path2.lineTo(size.width * 0.7350000, size.height * 0.3600000);
    path2.lineTo(size.width * 0.7350000, size.height * 0.3800000);
    path2.lineTo(size.width * 0.7300000, size.height * 0.3914286);
    path2.lineTo(size.width * 0.7216667, size.height * 0.4042857);
    path2.lineTo(size.width * 0.7116667, size.height * 0.4128571);
    path2.lineTo(size.width * 0.7016667, size.height * 0.4228571);
    path2.lineTo(size.width * 0.7100000, size.height * 0.4400000);
    path2.lineTo(size.width * 0.7100000, size.height * 0.4600000);
    path2.lineTo(size.width * 0.7025000, size.height * 0.4714286);
    path2.lineTo(size.width * 0.6908333, size.height * 0.4814286);
    path2.lineTo(size.width * 0.6766667, size.height * 0.4871429);
    path2.lineTo(size.width * 0.6611667, size.height * 0.4945714);
    path2.lineTo(size.width * 0.6458333, size.height * 0.4985714);
    path2.lineTo(size.width * 0.6250000, size.height * 0.5071429);
    path2.lineTo(size.width * 0.6000000, size.height * 0.5085714);
    path2.lineTo(size.width * 0.5858333, size.height * 0.5085714);
    path2.lineTo(size.width * 0.5691667, size.height * 0.5114286);
    path2.lineTo(size.width * 0.5583333, size.height * 0.5128571);
    path2.lineTo(size.width * 0.5475000, size.height * 0.5157143);
    path2.lineTo(size.width * 0.5366667, size.height * 0.5157143);
    path2.lineTo(size.width * 0.5316667, size.height * 0.5028571);
    path2.lineTo(size.width * 0.5283333, size.height * 0.4971429);
    path2.close();

    canvas.drawPath(path2, paint2);

    Path path3 = Path();
    path3.moveTo(size.width * 0.5266667, size.height * 0.5442857);
    path3.quadraticBezierTo(size.width * 0.5504167, size.height * 0.5464286,
        size.width * 0.5583333, size.height * 0.5471429);
    path3.lineTo(size.width * 0.5750000, size.height * 0.5485714);
    path3.lineTo(size.width * 0.5933333, size.height * 0.5514286);
    path3.lineTo(size.width * 0.6116667, size.height * 0.5542857);
    path3.lineTo(size.width * 0.6408333, size.height * 0.5657143);
    path3.lineTo(size.width * 0.6675000, size.height * 0.5800000);
    path3.lineTo(size.width * 0.6841667, size.height * 0.5971429);
    path3.lineTo(size.width * 0.6958333, size.height * 0.6228571);
    path3.lineTo(size.width * 0.6950000, size.height * 0.6400000);
    path3.lineTo(size.width * 0.6933333, size.height * 0.6585714);
    path3.lineTo(size.width * 0.6900000, size.height * 0.6700000);
    path3.lineTo(size.width * 0.6833333, size.height * 0.6800000);
    path3.lineTo(size.width * 0.6791667, size.height * 0.6871429);
    path3.lineTo(size.width * 0.6733333, size.height * 0.6900000);
    path3.lineTo(size.width * 0.6691667, size.height * 0.6914286);
    path3.lineTo(size.width * 0.6708333, size.height * 0.7200000);
    path3.lineTo(size.width * 0.6666667, size.height * 0.7457143);
    path3.lineTo(size.width * 0.6533333, size.height * 0.7528571);
    path3.lineTo(size.width * 0.6433333, size.height * 0.7571429);
    path3.lineTo(size.width * 0.6350000, size.height * 0.7571429);
    path3.lineTo(size.width * 0.6291667, size.height * 0.7571429);
    path3.lineTo(size.width * 0.6283333, size.height * 0.7742857);
    path3.lineTo(size.width * 0.6183333, size.height * 0.7828571);
    path3.lineTo(size.width * 0.6000000, size.height * 0.7828571);
    path3.quadraticBezierTo(size.width * 0.5892500, size.height * 0.7736429,
        size.width * 0.5856667, size.height * 0.7705714);
    path3.quadraticBezierTo(size.width * 0.5832083, size.height * 0.7668571,
        size.width * 0.5758333, size.height * 0.7557143);
    path3.lineTo(size.width * 0.5700000, size.height * 0.7457143);
    path3.lineTo(size.width * 0.5633333, size.height * 0.7285714);
    path3.lineTo(size.width * 0.5458333, size.height * 0.6828571);
    path3.lineTo(size.width * 0.5366667, size.height * 0.6614286);
    path3.lineTo(size.width * 0.5291667, size.height * 0.6457143);
    path3.lineTo(size.width * 0.5233333, size.height * 0.6171429);
    path3.lineTo(size.width * 0.5216667, size.height * 0.5857143);
    path3.lineTo(size.width * 0.5175000, size.height * 0.5671429);
    path3.quadraticBezierTo(size.width * 0.5197917, size.height * 0.5614286,
        size.width * 0.5266667, size.height * 0.5442857);
    path3.close();

    canvas.drawPath(path3, paint2);

    Path path4 = Path();
    path4.moveTo(size.width * 0.4900000, size.height * 0.6314286);
    path4.lineTo(size.width * 0.4816667, size.height * 0.6514286);
    path4.lineTo(size.width * 0.4766667, size.height * 0.6657143);
    path4.lineTo(size.width * 0.4666667, size.height * 0.6928571);
    path4.lineTo(size.width * 0.4616667, size.height * 0.7171429);
    path4.lineTo(size.width * 0.4541667, size.height * 0.7485714);
    path4.lineTo(size.width * 0.4466667, size.height * 0.7742857);
    path4.lineTo(size.width * 0.4341667, size.height * 0.7942857);
    path4.lineTo(size.width * 0.4200000, size.height * 0.8000000);
    path4.lineTo(size.width * 0.4075000, size.height * 0.7914286);
    path4.lineTo(size.width * 0.3950000, size.height * 0.7757143);
    path4.lineTo(size.width * 0.3933333, size.height * 0.7542857);
    path4.lineTo(size.width * 0.3770000, size.height * 0.7657143);
    path4.lineTo(size.width * 0.3625000, size.height * 0.7628571);
    path4.lineTo(size.width * 0.3516667, size.height * 0.7585714);
    path4.lineTo(size.width * 0.3466667, size.height * 0.7500000);
    path4.lineTo(size.width * 0.3416667, size.height * 0.7357143);
    path4.lineTo(size.width * 0.3416667, size.height * 0.7157143);
    path4.lineTo(size.width * 0.3441667, size.height * 0.6985714);
    path4.lineTo(size.width * 0.3333333, size.height * 0.6957143);
    path4.lineTo(size.width * 0.3266667, size.height * 0.6828571);
    path4.lineTo(size.width * 0.3233333, size.height * 0.6542857);
    path4.lineTo(size.width * 0.3283333, size.height * 0.6285714);
    path4.lineTo(size.width * 0.3333333, size.height * 0.6142857);
    path4.lineTo(size.width * 0.3483333, size.height * 0.5942857);
    path4.lineTo(size.width * 0.3658333, size.height * 0.5771429);
    path4.lineTo(size.width * 0.3800000, size.height * 0.5700000);
    path4.lineTo(size.width * 0.3925000, size.height * 0.5642857);
    path4.lineTo(size.width * 0.4050000, size.height * 0.5600000);
    path4.lineTo(size.width * 0.4191667, size.height * 0.5571429);
    path4.lineTo(size.width * 0.4350000, size.height * 0.5514286);
    path4.lineTo(size.width * 0.4491667, size.height * 0.5442857);
    path4.lineTo(size.width * 0.4700000, size.height * 0.5371429);
    path4.lineTo(size.width * 0.4866667, size.height * 0.5371429);
    path4.lineTo(size.width * 0.4908333, size.height * 0.5514286);
    path4.lineTo(size.width * 0.4975000, size.height * 0.5642857);
    path4.lineTo(size.width * 0.4925000, size.height * 0.5885714);
    path4.lineTo(size.width * 0.4900000, size.height * 0.6157143);
    path4.lineTo(size.width * 0.4900000, size.height * 0.6314286);
    path4.close();

    canvas.drawPath(path4, paint2);

    Path path5 = Path();
    path5.moveTo(size.width * 0.4850000, size.height * 0.4928571);
    path5.lineTo(size.width * 0.4791667, size.height * 0.4742857);
    path5.lineTo(size.width * 0.4700000, size.height * 0.4571429);
    path5.lineTo(size.width * 0.4516667, size.height * 0.4228571);
    path5.lineTo(size.width * 0.4308333, size.height * 0.3942857);
    path5.lineTo(size.width * 0.4016667, size.height * 0.3600000);
    path5.lineTo(size.width * 0.3766667, size.height * 0.3385714);
    path5.lineTo(size.width * 0.3458333, size.height * 0.3142857);
    path5.lineTo(size.width * 0.3200000, size.height * 0.3100000);
    path5.lineTo(size.width * 0.3075000, size.height * 0.3042857);
    path5.lineTo(size.width * 0.2983333, size.height * 0.3085714);
    path5.lineTo(size.width * 0.2858333, size.height * 0.3214286);
    path5.lineTo(size.width * 0.2825000, size.height * 0.3342857);
    path5.lineTo(size.width * 0.2883333, size.height * 0.3542857);
    path5.lineTo(size.width * 0.2941667, size.height * 0.3671429);
    path5.lineTo(size.width * 0.3033333, size.height * 0.3814286);
    path5.lineTo(size.width * 0.3108333, size.height * 0.3900000);
    path5.lineTo(size.width * 0.2991667, size.height * 0.3914286);
    path5.lineTo(size.width * 0.2933333, size.height * 0.4028571);
    path5.lineTo(size.width * 0.2941667, size.height * 0.4185714);
    path5.lineTo(size.width * 0.3000000, size.height * 0.4400000);
    path5.lineTo(size.width * 0.3100000, size.height * 0.4500000);
    path5.lineTo(size.width * 0.3200000, size.height * 0.4542857);
    path5.lineTo(size.width * 0.3158333, size.height * 0.4714286);
    path5.lineTo(size.width * 0.3191667, size.height * 0.4985714);
    path5.lineTo(size.width * 0.3333333, size.height * 0.5128571);
    path5.lineTo(size.width * 0.3466667, size.height * 0.5214286);
    path5.lineTo(size.width * 0.3650000, size.height * 0.5214286);
    path5.lineTo(size.width * 0.3866667, size.height * 0.5185714);
    path5.lineTo(size.width * 0.4116667, size.height * 0.5228571);
    path5.lineTo(size.width * 0.4325000, size.height * 0.5185714);
    path5.lineTo(size.width * 0.4583333, size.height * 0.5171429);
    path5.lineTo(size.width * 0.4741667, size.height * 0.5142857);
    path5.lineTo(size.width * 0.4816667, size.height * 0.5142857);
    path5.lineTo(size.width * 0.4850000, size.height * 0.4928571);
    path5.close();

    canvas.drawPath(path5, paint2);

    Paint paint6 = Paint();
    paint6.color = color3;

    Path path6 = Path();
    path6.moveTo(size.width * 0.5100000, size.height * 0.4514286);
    path6.lineTo(size.width * 0.5183333, size.height * 0.4571429);
    path6.lineTo(size.width * 0.5233333, size.height * 0.4657143);
    path6.lineTo(size.width * 0.5275000, size.height * 0.4857143);
    path6.lineTo(size.width * 0.5275000, size.height * 0.5057143);
    path6.lineTo(size.width * 0.5266667, size.height * 0.5328571);
    path6.lineTo(size.width * 0.5233333, size.height * 0.5500000);
    path6.lineTo(size.width * 0.5166667, size.height * 0.5628571);
    path6.lineTo(size.width * 0.5091667, size.height * 0.5714286);
    path6.lineTo(size.width * 0.4983333, size.height * 0.5657143);
    path6.lineTo(size.width * 0.4900000, size.height * 0.5528571);
    path6.lineTo(size.width * 0.4866667, size.height * 0.5342857);
    path6.lineTo(size.width * 0.4841667, size.height * 0.5142857);
    path6.lineTo(size.width * 0.4850000, size.height * 0.4957143);
    path6.lineTo(size.width * 0.4900000, size.height * 0.4685714);
    path6.lineTo(size.width * 0.4975000, size.height * 0.4571429);
    path6.lineTo(size.width * 0.5100000, size.height * 0.4514286);
    path6.close();

    canvas.drawPath(path6, paint6);

    Path path7 = Path();
    path7.moveTo(size.width * 0.5166667, size.height * 0.5685714);
    path7.lineTo(size.width * 0.5216667, size.height * 0.5871429);
    path7.lineTo(size.width * 0.5233333, size.height * 0.6057143);
    path7.lineTo(size.width * 0.5250000, size.height * 0.6314286);
    path7.lineTo(size.width * 0.5275000, size.height * 0.6557143);
    path7.lineTo(size.width * 0.5266667, size.height * 0.6828571);
    path7.lineTo(size.width * 0.5266667, size.height * 0.7000000);
    path7.quadraticBezierTo(size.width * 0.5249167, size.height * 0.7171429,
        size.width * 0.5243333, size.height * 0.7228571);
    path7.quadraticBezierTo(size.width * 0.5236667, size.height * 0.7282143,
        size.width * 0.5216667, size.height * 0.7442857);
    path7.lineTo(size.width * 0.5183333, size.height * 0.7571429);
    path7.lineTo(size.width * 0.5148333, size.height * 0.7771429);
    path7.lineTo(size.width * 0.5100000, size.height * 0.7871429);
    path7.lineTo(size.width * 0.5066667, size.height * 0.7657143);
    path7.lineTo(size.width * 0.5025000, size.height * 0.7457143);
    path7.lineTo(size.width * 0.5000000, size.height * 0.7257143);
    path7.lineTo(size.width * 0.4966667, size.height * 0.6985714);
    path7.lineTo(size.width * 0.4933333, size.height * 0.6757143);
    path7.lineTo(size.width * 0.4925000, size.height * 0.6471429);
    path7.lineTo(size.width * 0.4916667, size.height * 0.6085714);
    path7.lineTo(size.width * 0.4933333, size.height * 0.5885714);
    path7.lineTo(size.width * 0.4966667, size.height * 0.5671429);
    path7.lineTo(size.width * 0.5066667, size.height * 0.5700000);
    path7.lineTo(size.width * 0.5166667, size.height * 0.5685714);
    path7.close();

    canvas.drawPath(path7, paint6);

    Path path8 = Path();
    path8.moveTo(size.width * 0.5108333, size.height * 0.4514286);
    path8.lineTo(size.width * 0.5166667, size.height * 0.4400000);
    path8.lineTo(size.width * 0.5191667, size.height * 0.4285714);
    path8.lineTo(size.width * 0.5150000, size.height * 0.4228571);
    path8.lineTo(size.width * 0.5100000, size.height * 0.4171429);
    path8.lineTo(size.width * 0.5075000, size.height * 0.4057143);
    path8.lineTo(size.width * 0.5108333, size.height * 0.3942857);
    path8.lineTo(size.width * 0.5025000, size.height * 0.3900000);
    path8.lineTo(size.width * 0.4966667, size.height * 0.3928571);
    path8.lineTo(size.width * 0.5008333, size.height * 0.4057143);
    path8.lineTo(size.width * 0.4991667, size.height * 0.4171429);
    path8.lineTo(size.width * 0.4941667, size.height * 0.4242857);
    path8.lineTo(size.width * 0.4900000, size.height * 0.4257143);
    path8.lineTo(size.width * 0.4900000, size.height * 0.4357143);
    path8.lineTo(size.width * 0.4941667, size.height * 0.4457143);
    path8.lineTo(size.width * 0.4991667, size.height * 0.4528571);
    path8.lineTo(size.width * 0.5041667, size.height * 0.4542857);
    path8.lineTo(size.width * 0.5108333, size.height * 0.4514286);
    path8.close();

    canvas.drawPath(path8, paint6);

    Paint paint9 = Paint();
    paint9.color = Colors.black;
    paint9.style = PaintingStyle.stroke;
    paint9.strokeWidth = 6.849999904632568;

    Path path9 = Path();
    path9.moveTo(size.width * 0.5191667, size.height * 0.4171429);
    path9.lineTo(size.width * 0.5141667, size.height * 0.4200000);
    path9.lineTo(size.width * 0.5075000, size.height * 0.4142857);
    path9.lineTo(size.width * 0.5091667, size.height * 0.4000000);
    path9.lineTo(size.width * 0.5125000, size.height * 0.3957143);
    path9.lineTo(size.width * 0.5066667, size.height * 0.3900000);
    path9.lineTo(size.width * 0.5091667, size.height * 0.3800000);
    path9.lineTo(size.width * 0.5100000, size.height * 0.3685714);
    path9.lineTo(size.width * 0.5108333, size.height * 0.3571429);
    path9.lineTo(size.width * 0.5125000, size.height * 0.3442857);
    path9.lineTo(size.width * 0.5141667, size.height * 0.3328571);
    path9.lineTo(size.width * 0.5183333, size.height * 0.3200000);
    path9.lineTo(size.width * 0.5225000, size.height * 0.3028571);
    path9.lineTo(size.width * 0.5316667, size.height * 0.2828571);
    path9.lineTo(size.width * 0.5383333, size.height * 0.2728571);
    path9.lineTo(size.width * 0.5508333, size.height * 0.2585714);
    path9.lineTo(size.width * 0.5600000, size.height * 0.2485714);
    path9.lineTo(size.width * 0.5641667, size.height * 0.2442857);
    path9.lineTo(size.width * 0.5691667, size.height * 0.2357143);
    path9.lineTo(size.width * 0.5733333, size.height * 0.2357143);
    path9.lineTo(size.width * 0.5775000, size.height * 0.2414286);
    path9.lineTo(size.width * 0.5741667, size.height * 0.2485714);
    path9.lineTo(size.width * 0.5658333, size.height * 0.2514286);
    path9.lineTo(size.width * 0.5583333, size.height * 0.2571429);
    path9.lineTo(size.width * 0.5525000, size.height * 0.2671429);
    path9.lineTo(size.width * 0.5458333, size.height * 0.2742857);
    path9.lineTo(size.width * 0.5383333, size.height * 0.2828571);
    path9.lineTo(size.width * 0.5308333, size.height * 0.2928571);
    path9.lineTo(size.width * 0.5275000, size.height * 0.3057143);
    path9.lineTo(size.width * 0.5225000, size.height * 0.3142857);
    path9.lineTo(size.width * 0.5183333, size.height * 0.3285714);
    path9.lineTo(size.width * 0.5166667, size.height * 0.3385714);
    path9.lineTo(size.width * 0.5150000, size.height * 0.3500000);
    path9.lineTo(size.width * 0.5141667, size.height * 0.3628571);
    path9.lineTo(size.width * 0.5125000, size.height * 0.3771429);
    path9.lineTo(size.width * 0.5166667, size.height * 0.3985714);
    path9.lineTo(size.width * 0.5191667, size.height * 0.4171429);
    path9.close();

    canvas.drawPath(path9, paint9);

    Paint paint10 = Paint();
    paint10.color = Colors.black;
    paint10.style = PaintingStyle.stroke;
    paint10.strokeWidth = 6.849999904632568;

    Path path10 = Path();
    path10.moveTo(size.width * 0.4883333, size.height * 0.4200000);
    path10.lineTo(size.width * 0.4933333, size.height * 0.4257143);
    path10.lineTo(size.width * 0.4983333, size.height * 0.4185714);
    path10.lineTo(size.width * 0.5016667, size.height * 0.4057143);
    path10.lineTo(size.width * 0.4983333, size.height * 0.3971429);
    path10.lineTo(size.width * 0.4950000, size.height * 0.3857143);
    path10.lineTo(size.width * 0.4916667, size.height * 0.3671429);
    path10.lineTo(size.width * 0.4875000, size.height * 0.3485714);
    path10.lineTo(size.width * 0.4816667, size.height * 0.3300000);
    path10.lineTo(size.width * 0.4733333, size.height * 0.3071429);
    path10.lineTo(size.width * 0.4658333, size.height * 0.2928571);
    path10.lineTo(size.width * 0.4575000, size.height * 0.2785714);
    path10.lineTo(size.width * 0.4491667, size.height * 0.2671429);
    path10.lineTo(size.width * 0.4416667, size.height * 0.2585714);
    path10.lineTo(size.width * 0.4358333, size.height * 0.2542857);
    path10.lineTo(size.width * 0.4308333, size.height * 0.2457143);
    path10.lineTo(size.width * 0.4250000, size.height * 0.2457143);
    path10.lineTo(size.width * 0.4216667, size.height * 0.2542857);
    path10.lineTo(size.width * 0.4233333, size.height * 0.2642857);
    path10.lineTo(size.width * 0.4316667, size.height * 0.2600000);
    path10.lineTo(size.width * 0.4425000, size.height * 0.2671429);
    path10.lineTo(size.width * 0.4508333, size.height * 0.2771429);
    path10.lineTo(size.width * 0.4583333, size.height * 0.2885714);
    path10.lineTo(size.width * 0.4658333, size.height * 0.3028571);
    path10.lineTo(size.width * 0.4725000, size.height * 0.3200000);
    path10.lineTo(size.width * 0.4783333, size.height * 0.3371429);
    path10.lineTo(size.width * 0.4850000, size.height * 0.3600000);
    path10.lineTo(size.width * 0.4891667, size.height * 0.3771429);
    path10.lineTo(size.width * 0.4900000, size.height * 0.3857143);
    path10.lineTo(size.width * 0.4916667, size.height * 0.3914286);
    path10.lineTo(size.width * 0.4883333, size.height * 0.4042857);
    path10.lineTo(size.width * 0.4883333, size.height * 0.4200000);
    path10.close();

    canvas.drawPath(path10, paint10);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

void MessageBox(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    title: "Coloring",
    desc: 'Color the Following figure witn given colors.',
    btnCancelText: "Got it",
    showCloseIcon: false,
  )..show();
}
