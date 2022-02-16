// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';

class ar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => TextRecognitionState(),
        child: TextRecognitionPage(),
      ),
    );
  }
}

class TextRecognitionPage extends StatefulWidget {
  @override
  _TextRecognitionPageState createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  TextRecognition _textRecognition = TextRecognition();

  /* TextRecognition? _textRecognition = TextRecognition(
    options: TextRecognitionOptions.Japanese
  ); */

  @override
  void dispose() {
    _textRecognition?.dispose();
    super.dispose();
  }

  void showImage(String text) {
    if (text == "Apple") {
      imgPath = "assets/friuts/Apple.png";
    } else if (text == "Mango") {
      imgPath = "assets/friuts/Mango.png";
    } else if (text == "Cat") {
      imgPath = "assets/animal/Cat.png";
    } else if (text == "Dog") {
      imgPath = "assets/animal/Dog.png";
    } else {
      imgPath = "assets/empty.PNG";
    }
  }

  String imgPath = 'assets/kite.png';

  Future<void> _startRecognition(InputImage image) async {
    TextRecognitionState state = Provider.of(context, listen: false);

    if (state.isNotProcessing) {
      state.startProcessing();
      state.image = image;
      state.data = await _textRecognition?.process(image);
      state.stopProcessing();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputCameraView(
      mode: InputCameraMode.gallery,
      // resolutionPreset: ResolutionPreset.high,
      title: 'Text Recognition',
      onImage: _startRecognition,
      overlay: Consumer<TextRecognitionState>(
        builder: (_, state, __) {
          showImage(state.text);
          if (state.isNotEmpty) {
            return Stack(children: [
              Positioned(
                  right: 30,
                  top: 50,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image(
                        image: AssetImage(
                      imgPath,
                    )),
                  )),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Text(
                    state.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ]);
          }

          return Container();
        },
      ),
    );
  }
}

class TextRecognitionState extends ChangeNotifier {
  InputImage _image;
  RecognizedText _data;
  bool _isProcessing = false;

  InputImage get image => _image;
  RecognizedText get data => _data;
  String get text => _data.text;
  bool get isNotProcessing => !_isProcessing;
  bool get isNotEmpty => _data != null && text.isNotEmpty;

  void startProcessing() {
    _isProcessing = true;
    notifyListeners();
  }

  void stopProcessing() {
    _isProcessing = false;
    notifyListeners();
  }

  set image(InputImage image) {
    _image = image;
    notifyListeners();
  }

  set data(RecognizedText data) {
    _data = data;
    notifyListeners();
  }
}
