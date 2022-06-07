
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool? looping;
  final bool? autoplay;


  VideoItem({
    required this.videoPlayerController,
    this.looping, this.autoplay,
    Key? key,
  }) : super(key: key);
  State<StatefulWidget> createState() => new _VideoItem();
}



class _VideoItem extends State<VideoItem> {

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 2,
      autoInitialize: true,
      autoPlay: widget.autoplay!,
      looping: widget.looping!,
      //showControls: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,

      child: Chewie(


        controller: _chewieController!,
      ),
    );
  }


}

