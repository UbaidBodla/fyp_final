// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cube/flutter_cube.dart';

// class Humanbody extends StatefulWidget {
//   const Humanbody({Key key}) : super(key: key);

//   @override
//   _HumanbodyState createState() => _HumanbodyState();
// }

// class _HumanbodyState extends State<Humanbody> {
//   String currentModel = modelList[0].model;
//   @override
//   Widget build(BuildContext context) {
//     print(currentModel);
//     double screenHeight = (MediaQuery.of(context).size.height / 100);
//     double screenWidth = (MediaQuery.of(context).size.width / 100);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text("Parts of Body"),
//       ),
//       body: Container(
//         color: Colors.pinkAccent,
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: screenHeight * 18,
//                 width: screenWidth * 100,
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   border: Border.all(color: Colors.deepPurple, width: 4),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   //controller: controller,
//                   child: listofContainers(screenWidth, screenHeight),
//                 ),
//               ),
//             ),
//             ItemDisplay(
//               ObjectFile: currentModel,
//             ),
//             Container(
//               height: screenHeight * 10,
//               width: screenWidth * 90,
//               decoration: BoxDecoration(
//                 color: Colors.blueGrey,
//                 border: Border.all(color: Colors.deepPurple, width: 4),
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getContainer(name, image, model, screenWidth, screenHeight) {
//     return InkWell(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(image),
//               fit: BoxFit.contain,
//             ),
//             color: Color.fromRGBO(
//                 130, 198, 27, 1), //rgb(98, 166, 223)rgb(130, 198, 27)
//             //border: Border.all(color: Colors.green, width: 5.0),
//             borderRadius: BorderRadius.all(Radius.circular(20) //
//                 ),
//           ),
//           height: screenHeight * 15,
//           width: screenWidth * 25,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           currentModel = model;
//           print(currentModel);
//           super.widget;
//         });
//       },
//     );
//   }

//   Row listofContainers(screenWidth, screenHeight) {
//     final List<Widget> rowList = [];
//     for (int i = 0; i < modelList.length; i++) {
//       rowList.addAll([
//         getContainer(modelList[i].name, modelList[i].image, modelList[i].model,
//             screenWidth, screenHeight),
//       ]);
//     }

//     final Row rowStars = Row(
//       children: rowList,
//     );

//     return rowStars;
//   }
// }

// class ItemDisplay extends StatelessWidget {
//   final String ObjectFile;
//   const ItemDisplay({
//     Key key,
//     @required this.ObjectFile,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = (MediaQuery.of(context).size.height / 100);
//     double screenWidth = (MediaQuery.of(context).size.width / 100);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: screenHeight * 50,
//         width: screenWidth * 90,
//         decoration: BoxDecoration(
//           color: Colors.blueGrey,
//           border: Border.all(color: Colors.deepPurple, width: 4),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         child: Container(
//           child: Cube(
//             onSceneCreated: (Scene scene) {
//               scene.world.add(Object(fileName: this.ObjectFile));
//               scene.camera.zoom = 8;
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Data Model Class: make class for data models of object records.
// class Model {
//   String name;
//   String image;
//   String model;
//   Model({this.name, this.image, this.model});
// }

// //Object List:list of object which contains data as object record class model form.
// List<Model> modelList = [
//   Model(
//       name: 'Hand',
//       image: "assets/3d/hand.jpg",
//       model: "assets/3d/model2/hands.obj"),
//   Model(name: 'Arm', image: "assets/3d/arm.jpg", model: "assets/3d/cube/h.obj"),
//   Model(name: 'Foot', image: "assets/3d/foot.jpg", model: "assets/3d/leg.png"),
//   Model(
//       name: 'Leg',
//       image: "assets/3d/leg.png",
//       model: "assets/3d/model2/hands.obj"),
//   Model(
//       name: 'Head',
//       image: "assets/3d/hand.jpg",
//       model: "assets/3d/model2/hands.obj"),
//   Model(
//       name: 'Body',
//       image: "assets/3d/hand.jpg",
//       model: "assets/3d/model2/hands.obj"),
// ];
