
import 'package:flutter_apptest/components/videosList/videoItem.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideosList extends StatefulWidget {
  State<StatefulWidget> createState() => new _VideosList();
}



class _VideosList extends State<VideosList> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Videos'),backgroundColor: Colors.deepOrangeAccent,),
      body:
      ListView(
        children: <Widget>[
          VideoItem(
            videoPlayerController: VideoPlayerController.network(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            ),
            looping: false,
            autoplay: false,
          ),
          VideoItem(
            videoPlayerController: VideoPlayerController.network(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
            ),
            looping: false,
            autoplay: false,
          ),

        ],
      ),

      // Center(
      //   child: _controller!.value.isInitialized
      //       ? AspectRatio(
      //     aspectRatio: _controller!.value.aspectRatio,
      //     child: VideoPlayer(_controller!),
      //   )
      //       : Container(child: Text('erroe'),),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller!.value.isPlaying
      //           ? _controller!.pause()
      //           : _controller!.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),



    );

  }
}