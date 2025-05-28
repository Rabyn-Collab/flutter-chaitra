import 'package:flutter/material.dart';
import 'package:new_pod_player/new_pod_player.dart';

class PlayVideoFromYoutube extends StatefulWidget {
  final String videoId;
  const PlayVideoFromYoutube({Key? key, required this.videoId}) : super(key: key);

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/${widget.videoId}'),
      podPlayerConfig: PodPlayerConfig(
        videoQualityPriority: [1080, 720]
      )
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  PodVideoPlayer(controller: controller);
  }
}
