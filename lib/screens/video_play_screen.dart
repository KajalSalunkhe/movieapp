// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayScreen extends StatefulWidget {
//   const VideoPlayScreen({super.key});

//   @override
//   State<VideoPlayScreen> createState() => _VideoPlayScreenState();
// }

// class _VideoPlayScreenState extends State<VideoPlayScreen> {
//   late VideoPlayerController _videoController;

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.network(
//         "https://www.pexels.com/video/drops-of-liquid-on-a-tray-to-be-use-as-samples-3195394/")
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: Center(
//           child: AspectRatio(
//         aspectRatio: _videoController.value.aspectRatio,
//         child: VideoPlayer(_videoController),
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayScreen extends StatelessWidget {
  final String videoUrl;

  VideoPlayScreen({required this.videoUrl});

  void _launchVideoUrl() async {
    if (await canLaunch(videoUrl)) {
      await launch(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: _launchVideoUrl,
      //     child: Text('Play Video'),
      //   ),
      // ),
    );
  }
}
