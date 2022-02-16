import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class lamp extends StatefulWidget {
  const lamp({Key key}) : super(key: key);

  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<lamp> {
  GlobalKey _keyYellow = GlobalKey();
  //GlobalKey _keyRed = GlobalKey();
  Color color1 = Colors.white;
  Color firstcolor = Colors.white;
  Color secondcolor = Colors.white;
  Color thirdcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('assets/bus.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                thickness: 12,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (color1 == Colors.black) {
                      firstcolor = color1;
                    } else if (color1 == Color.fromRGBO(127, 127, 127, 1)) {
                      secondcolor = color1;
                    } else {
                      thirdcolor = Color.fromRGBO(255, 252, 0, 1);
                    }
                  });
                },
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.black12,
                  child: CustomPaint(
                    key: _keyYellow,
                    painter: lampPainter(firstcolor, secondcolor, thirdcolor),
                    child: Container(
                      height: 400,
                      width: 400,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = Colors.black;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = Color.fromRGBO(127, 127, 127, 1);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Color.fromRGBO(127, 127, 127, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color1 = Color.fromRGBO(255, 252, 0, 1);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Color.fromRGBO(255, 252, 0, 1),
                    ),
                  ),
                ],
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//For Butterfly
class lampPainter extends CustomPainter {
  Color color1;
  Color color2;
  Color color3;
  lampPainter(this.color1, this.color2, this.color3);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color1;

    Paint paint0 = Paint();
    paint0.color = color1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5833333, size.height * 0.9000000);
    path0.lineTo(size.width * 0.6233333, size.height * 0.8942857);
    path0.lineTo(size.width * 0.6675000, size.height * 0.8842857);
    path0.lineTo(size.width * 0.6566667, size.height * 0.8600000);
    path0.lineTo(size.width * 0.6433333, size.height * 0.8485714);
    path0.lineTo(size.width * 0.6241667, size.height * 0.8314286);
    path0.lineTo(size.width * 0.6000000, size.height * 0.8228571);
    path0.lineTo(size.width * 0.5750000, size.height * 0.8177143);
    path0.lineTo(size.width * 0.6183333, size.height * 0.4242857);
    path0.lineTo(size.width * 0.6266667, size.height * 0.4114286);
    path0.lineTo(size.width * 0.6283333, size.height * 0.3971429);
    path0.lineTo(size.width * 0.6233333, size.height * 0.3828571);
    path0.lineTo(size.width * 0.6166667, size.height * 0.3757143);
    path0.lineTo(size.width * 0.6116667, size.height * 0.3742857);
    path0.lineTo(size.width * 0.4983333, size.height * 0.1371429);
    path0.lineTo(size.width * 0.4958333, size.height * 0.1200000);
    path0.lineTo(size.width * 0.4916667, size.height * 0.1100000);
    path0.lineTo(size.width * 0.4816667, size.height * 0.1085714);
    path0.lineTo(size.width * 0.4741667, size.height * 0.1114286);
    path0.lineTo(size.width * 0.4716667, size.height * 0.1271429);
    path0.lineTo(size.width * 0.4566667, size.height * 0.1514286);
    path0.lineTo(size.width * 0.4466667, size.height * 0.1428571);
    path0.lineTo(size.width * 0.4366667, size.height * 0.1414286);
    path0.lineTo(size.width * 0.4366667, size.height * 0.1228571);
    path0.lineTo(size.width * 0.4300000, size.height * 0.1185714);
    path0.lineTo(size.width * 0.4258333, size.height * 0.1185714);
    path0.lineTo(size.width * 0.4241667, size.height * 0.1385714);
    path0.lineTo(size.width * 0.4116667, size.height * 0.1457143);
    path0.lineTo(size.width * 0.4033333, size.height * 0.1571429);
    path0.lineTo(size.width * 0.3950000, size.height * 0.1728571);
    path0.lineTo(size.width * 0.3900000, size.height * 0.1900000);
    path0.lineTo(size.width * 0.3883333, size.height * 0.2214286);
    path0.lineTo(size.width * 0.3866667, size.height * 0.2585714);
    path0.lineTo(size.width * 0.3866667, size.height * 0.2857143);
    path0.lineTo(size.width * 0.3708333, size.height * 0.3014286);
    path0.lineTo(size.width * 0.3616667, size.height * 0.3142857);
    path0.lineTo(size.width * 0.3533333, size.height * 0.3228571);
    path0.lineTo(size.width * 0.3475000, size.height * 0.3400000);
    path0.lineTo(size.width * 0.3433333, size.height * 0.3657143);
    path0.lineTo(size.width * 0.3441667, size.height * 0.3885714);
    path0.lineTo(size.width * 0.3441667, size.height * 0.4114286);
    path0.lineTo(size.width * 0.3491667, size.height * 0.4314286);
    path0.lineTo(size.width * 0.3666667, size.height * 0.4457143);
    path0.lineTo(size.width * 0.3883333, size.height * 0.4557143);
    path0.lineTo(size.width * 0.4125000, size.height * 0.4628571);
    path0.lineTo(size.width * 0.4266667, size.height * 0.4628571);
    path0.lineTo(size.width * 0.4416667, size.height * 0.4628571);
    path0.lineTo(size.width * 0.4575000, size.height * 0.4600000);
    path0.lineTo(size.width * 0.4658333, size.height * 0.4585714);
    path0.lineTo(size.width * 0.4775000, size.height * 0.4542857);
    path0.lineTo(size.width * 0.4883333, size.height * 0.4514286);
    path0.lineTo(size.width * 0.4975000, size.height * 0.4428571);
    path0.lineTo(size.width * 0.5083333, size.height * 0.4342857);
    path0.lineTo(size.width * 0.5158333, size.height * 0.4200000);
    path0.lineTo(size.width * 0.5166667, size.height * 0.4028571);
    path0.lineTo(size.width * 0.5166667, size.height * 0.3857143);
    path0.lineTo(size.width * 0.5166667, size.height * 0.3557143);
    path0.lineTo(size.width * 0.5108333, size.height * 0.3342857);
    path0.lineTo(size.width * 0.5033333, size.height * 0.3171429);
    path0.lineTo(size.width * 0.4916667, size.height * 0.3028571);
    path0.lineTo(size.width * 0.4816667, size.height * 0.2942857);
    path0.lineTo(size.width * 0.4758333, size.height * 0.2828571);
    path0.lineTo(size.width * 0.4733333, size.height * 0.2085714);
    path0.lineTo(size.width * 0.4708333, size.height * 0.1871429);
    path0.lineTo(size.width * 0.4666667, size.height * 0.1742857);
    path0.lineTo(size.width * 0.4766667, size.height * 0.1571429);
    path0.lineTo(size.width * 0.4833333, size.height * 0.1600000);
    path0.lineTo(size.width * 0.4866667, size.height * 0.1600000);
    path0.lineTo(size.width * 0.5991667, size.height * 0.3942857);
    path0.lineTo(size.width * 0.5983333, size.height * 0.4071429);
    path0.lineTo(size.width * 0.6016667, size.height * 0.4200000);
    path0.lineTo(size.width * 0.5566667, size.height * 0.8157143);
    path0.lineTo(size.width * 0.5391667, size.height * 0.8214286);
    path0.lineTo(size.width * 0.5208333, size.height * 0.8257143);
    path0.lineTo(size.width * 0.5066667, size.height * 0.8342857);
    path0.lineTo(size.width * 0.4941667, size.height * 0.8414286);
    path0.lineTo(size.width * 0.4800000, size.height * 0.8571429);
    path0.lineTo(size.width * 0.4691667, size.height * 0.8840000);
    path0.lineTo(size.width * 0.4983333, size.height * 0.8942857);
    path0.lineTo(size.width * 0.5408333, size.height * 0.9000000);
    path0.lineTo(size.width * 0.5833333, size.height * 0.9000000);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint();
    paint1.color = color2;

    Path path1 = Path();
    path1.moveTo(size.width * 0.5133333, size.height * 0.4114286);
    path1.lineTo(size.width * 0.5100000, size.height * 0.4214286);
    path1.lineTo(size.width * 0.5033333, size.height * 0.4314286);
    path1.lineTo(size.width * 0.4941667, size.height * 0.4357143);
    path1.lineTo(size.width * 0.4866667, size.height * 0.4428571);
    path1.lineTo(size.width * 0.4758333, size.height * 0.4485714);
    path1.lineTo(size.width * 0.4583333, size.height * 0.4528571);
    path1.lineTo(size.width * 0.4433333, size.height * 0.4557143);
    path1.lineTo(size.width * 0.4200000, size.height * 0.4542857);
    path1.lineTo(size.width * 0.4066667, size.height * 0.4542857);
    path1.lineTo(size.width * 0.3900000, size.height * 0.4485714);
    path1.lineTo(size.width * 0.3750000, size.height * 0.4400000);
    path1.lineTo(size.width * 0.3641667, size.height * 0.4342857);
    path1.lineTo(size.width * 0.3508333, size.height * 0.4185714);
    path1.lineTo(size.width * 0.3500000, size.height * 0.4028571);
    path1.lineTo(size.width * 0.3600000, size.height * 0.3900000);
    path1.lineTo(size.width * 0.3725000, size.height * 0.3785714);
    path1.lineTo(size.width * 0.3866667, size.height * 0.3728571);
    path1.lineTo(size.width * 0.3966667, size.height * 0.3728571);
    path1.lineTo(size.width * 0.4008333, size.height * 0.3900000);
    path1.lineTo(size.width * 0.4041667, size.height * 0.4114286);
    path1.lineTo(size.width * 0.4150000, size.height * 0.4257143);
    path1.lineTo(size.width * 0.4250000, size.height * 0.4328571);
    path1.lineTo(size.width * 0.4375000, size.height * 0.4314286);
    path1.lineTo(size.width * 0.4508333, size.height * 0.4242857);
    path1.lineTo(size.width * 0.4600000, size.height * 0.4057143);
    path1.lineTo(size.width * 0.4620000, size.height * 0.3708571);
    path1.lineTo(size.width * 0.4761667, size.height * 0.3754286);
    path1.lineTo(size.width * 0.4908333, size.height * 0.3800000);
    path1.lineTo(size.width * 0.5025000, size.height * 0.3900000);
    path1.lineTo(size.width * 0.5133333, size.height * 0.4114286);
    path1.close();

    canvas.drawPath(path1, paint1);

    Paint paint2 = Paint();
    paint2.color = color3;

    Path path2 = Path();
    path2.moveTo(size.width * 0.4583333, size.height * 0.3657143);
    path2.lineTo(size.width * 0.4591667, size.height * 0.3928571);
    path2.lineTo(size.width * 0.4566667, size.height * 0.4042857);
    path2.lineTo(size.width * 0.4508333, size.height * 0.4142857);
    path2.lineTo(size.width * 0.4433333, size.height * 0.4228571);
    path2.lineTo(size.width * 0.4366667, size.height * 0.4285714);
    path2.lineTo(size.width * 0.4283333, size.height * 0.4285714);
    path2.lineTo(size.width * 0.4200000, size.height * 0.4257143);
    path2.lineTo(size.width * 0.4125000, size.height * 0.4171429);
    path2.lineTo(size.width * 0.4075000, size.height * 0.4042857);
    path2.lineTo(size.width * 0.4033333, size.height * 0.3914286);
    path2.lineTo(size.width * 0.4026667, size.height * 0.3685714);
    path2.lineTo(size.width * 0.4133333, size.height * 0.3628571);
    path2.lineTo(size.width * 0.4216667, size.height * 0.3628571);
    path2.lineTo(size.width * 0.4383333, size.height * 0.3628571);
    path2.lineTo(size.width * 0.4583333, size.height * 0.3657143);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
