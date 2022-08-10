import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

late VideoPlayerController controller;
ChewieController? chewieController;
List<String> videos=[
  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
  'https://www.pexels.com/video/interior-design-of-a-modern-house-3773486/'

];

  Future<void> LoadVideoPlayer()async {
    controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    await Future.wait({controller.initialize()});
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
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
     controller.dispose();
     chewieController?.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Container(
      width: double.infinity,
      height: 200,
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
                  children: const [
                    Center(
                      child:
                        CircularProgressIndicator()
                    )
                  ],
                )
          ],


      ),
    );
  }
}
