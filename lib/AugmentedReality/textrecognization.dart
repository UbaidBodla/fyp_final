// import 'package:flutter/material.dart';
// import 'package:learning_input_image/learning_input_image.dart';
// import 'package:learning_text_recognition/learning_text_recognition.dart';
// import 'package:provider/provider.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/services.dart';

// class TextRecognitionPage extends StatefulWidget {
//   @override
//   _TextRecognitionPageState createState() => _TextRecognitionPageState();
// }

// class _TextRecognitionPageState extends State<TextRecognitionPage> {
//   TextRecognition _textRecognition = TextRecognition();

//   /* TextRecognition? _textRecognition = TextRecognition(
//     options: TextRecognitionOptions.Japanese
//   ); */

//   @override
//   void dispose() {
//     _textRecognition?.dispose();
//     super.dispose();
//   }

//   void showImage(String text) {
//     if (text == "Cat") {
//       ArCoreViewClass();
//       imgPath = "assets/cat.png";
//     } else {
//       imgPath = "assets/kite.png";
//     }
//   }

//   String imgPath = 'assets/kite.png';

//   Future<void> _startRecognition(InputImage image) async {
//     TextRecognitionState state = Provider.of(context, listen: false);

//     if (state.isNotProcessing) {
//       state.startProcessing();
//       state.image = image;
//       state.data = await _textRecognition?.process(image);
//       state.stopProcessing();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InputCameraView(
//       mode: InputCameraMode.gallery,
//       // resolutionPreset: ResolutionPreset.high,
//       title: 'Text Recognition',
//       onImage: _startRecognition,
//       overlay: Consumer<TextRecognitionState>(
//         builder: (_, state, __) {
//           showImage(state.text);
//           if (state.isNotEmpty) {
//             return Stack(children: [
//               Positioned(
//                   right: 30,
//                   top: 50,
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     child: Image(
//                         image: AssetImage(
//                       imgPath,
//                     )),
//                   )),
//               Center(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.8),
//                     borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                   ),
//                   child: Text(
//                     state.text,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ]);
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }

// class ArCoreViewClass extends StatefulWidget {
//   ArCoreViewClass({Key key}) : super(key: key);

//   @override
//   _ArCoreViewClassState createState() => _ArCoreViewClassState();
// }

// class _ArCoreViewClassState extends State<ArCoreViewClass> {
//   ArCoreController arCoreController;
//   Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();
//   Future _addSphere(ArCoreAugmentedImage augmentedImage) async {
//     final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');

//     final material = ArCoreMaterial(
//       color: Color.fromARGB(120, 66, 134, 244),
//       textureBytes: textureBytes.buffer.asUint8List(),
//     );
//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: augmentedImage.extentX / 2,
//     );
//     final node = ArCoreNode(
//       shape: sphere,
//     );
//     arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
//   }

//   _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
//     if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
//       augmentedImagesMap[augmentedImage.index] = augmentedImage;
//       _addSphere(augmentedImage);
//     }
//   }

//   loadSingleImage() async {
//     final ByteData bytes =
//         await rootBundle.load('assets/earth_augmented_image.jpg');
//     arCoreController.loadSingleAugmentedImage(
//         bytes: bytes.buffer.asUint8List());
//   }

//   loadImagesDatabase() async {
//     final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
//     arCoreController.loadAugmentedImagesDatabase(
//         bytes: bytes.buffer.asUint8List());
//   }

//   void _onArCoreViewCreated(ArCoreController controller) async {
//     arCoreController = controller;
//     arCoreController.onTrackingImage = _handleOnTrackingImage;
//     //loadSingleImage();
//     //OR
//     loadImagesDatabase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ArCoreView(
//         onArCoreViewCreated: _onArCoreViewCreated,
//         type: ArCoreViewType.AUGMENTEDIMAGES,
//       ),
//     );
//   }
// }

// class TextRecognitionState extends ChangeNotifier {
//   InputImage _image;
//   RecognizedText _data;
//   bool _isProcessing = false;

//   InputImage get image => _image;
//   RecognizedText get data => _data;
//   String get text => _data.text;
//   bool get isNotProcessing => !_isProcessing;
//   bool get isNotEmpty => _data != null && text.isNotEmpty;

//   void startProcessing() {
//     _isProcessing = true;
//     notifyListeners();
//   }

//   void stopProcessing() {
//     _isProcessing = false;
//     notifyListeners();
//   }

//   set image(InputImage image) {
//     _image = image;
//     notifyListeners();
//   }

//   set data(RecognizedText data) {
//     _data = data;
//     notifyListeners();
//   }
// }
