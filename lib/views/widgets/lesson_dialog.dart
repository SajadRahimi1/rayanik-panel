import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/urls.dart';

class LessonDialog extends StatefulWidget {
  const LessonDialog(
      {super.key, required this.videoUrl, required this.description});
  final String videoUrl, description;

  @override
  State<LessonDialog> createState() => _LessonDialogState();
}

class _LessonDialogState extends State<LessonDialog> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('$baseUrl/uploads/${widget.videoUrl}'))
      ..initialize().then((value) => setState(() {}));
    customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          playButton: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          pauseButton: Icon(
            Icons.pause,
            color: Colors.white,
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width / 4,
          height: MediaQuery.sizeOf(context).height / 1.1,
          child: Column(children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 4,
              height: MediaQuery.sizeOf(context).height / 3,
              child: CustomVideoPlayer(
                  customVideoPlayerController: customVideoPlayerController),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(widget.description),
              ),
            )
          ]),
        ));
  }
}
