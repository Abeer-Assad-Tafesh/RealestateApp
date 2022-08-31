import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  int videoIndex;
  VideoPlayerScreen({required this.videoIndex});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {


  late VideoPlayerController controller;
  ChewieController? chewieController;

  List<String> listVideos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    'https://www.storyblocks.com/video/search/butterfly'
  ];

  Future<void> LoadVideoPlayer()async {
    controller = VideoPlayerController.network(listVideos[widget.videoIndex]);
    await Future.wait({controller.initialize()});
    chewieController = ChewieController(
      videoPlayerController: controller,
      // autoPlay: true,
      // looping: true,
      allowFullScreen: true,
    );
  }

  @override
  void initState() {
    super.initState();
    LoadVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    chewieController?.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Container(
      width: double.infinity,
      height: 200.h,
      child: Stack(
        alignment: AlignmentDirectional.center,
          children: [
            chewieController != null &&
        chewieController! .videoPlayerController.value.isInitialized
            ?
                Chewie(controller: chewieController!)
                :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 200.h,
                        color: Colors.black.withOpacity(0.5),
                        child:
                        const Center(child: CircularProgressIndicator())
                    )
                  ],
                )
           ],
      ),
    );
  }
}
