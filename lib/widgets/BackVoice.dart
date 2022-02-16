import 'package:flutter_tts/flutter_tts.dart';

class VoiceClass {
  final FlutterTts _flutterTts = FlutterTts();
  Future speak(word) async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(.1);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak("$word");
    await _flutterTts.setVolume(5);
  }
}
