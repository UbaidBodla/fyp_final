import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  PlayerScreen({Key key, @required this.videoPlayerController, this.looping})
      : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  ChewieController _chewieController;

  @override
  void initState() {
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 3 / 2.5,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,

      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            '{$errorMessage}',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height / 100);
    //double screenWidth = (MediaQuery.of(context).size.width / 100);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 30,
        //width: screenWidth * 200,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.pause();
    _chewieController?.dispose();
    //ignore below
    // audioPlayer.stop();
    // audioPlayer?.dispose();
    super.dispose();
  }
}
