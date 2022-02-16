import 'package:alphabetgame/science/play.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EnlargeStoryScreen extends StatelessWidget {
  final String title;
  final String detail;
  final String image;
  EnlargeStoryScreen({this.title, this.detail, this.image});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            title,
            style: TextStyle(fontFamily: 'GochiHand'),
          ),
          // backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                //Make sure you have the same id associated to each element in the
                //source page's list
                tag: '',
                child: Image(
                  image: AssetImage('$image'),
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.fill,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  detail,
                  style: TextStyle(fontSize: 25, fontFamily: 'CabinSketch'),
                ),
              ),
              PlayerScreen(
                videoPlayerController:
                    VideoPlayerController.asset('videos/short.mp4'),
                looping: true,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  detail,
                  style: TextStyle(fontSize: 25, fontFamily: 'CabinSketch'),
                ),
              ),
              PlayerScreen(
                videoPlayerController: VideoPlayerController.asset(
                  'videos/BigBangTheory.mp4',
                ),
                looping: true,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  detail,
                  style: TextStyle(fontSize: 25, fontFamily: 'CabinSketch'),
                ),
              ),
              PlayerScreen(
                // This URL doesn't exist - will display an error
                videoPlayerController: VideoPlayerController.network(
                  'https://www.dailymotion.com/video/x861csi',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//C:\Users\tariq\3D Objects\E-Learn\alphabetgame\videos\short.mp4