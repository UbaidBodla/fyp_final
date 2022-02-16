import 'package:flutter/material.dart';

class FullBodyView extends StatelessWidget {
  const FullBodyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lebaled Diagram')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/3d/FullBody.jpg'),
            fit: BoxFit.fill,
          ),
          color: Color.fromRGBO(
              130, 198, 27, 1), //rgb(98, 166, 223)rgb(130, 198, 27)
          //border: Border.all(color: Colors.green, width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(20) //
              ),
        ),
      ),
    );
  }
}
