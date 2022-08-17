import 'package:flutter/material.dart';
import 'package:healthy_life/data/data.dart';
import 'package:healthy_life/models/style.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({Key? key}) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  String dataSource = 'assets/images/workout.mp4';
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          padding: const EdgeInsets.all(0.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              icon: const Icon(Icons.skip_previous),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              icon: const Icon(Icons.play_arrow),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              icon: const Icon(Icons.skip_next),
              color: Colors.black,
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return _buildStyles(context, index);
          },
        ))
      ]),
    );
  }
}

Widget _buildStyles(BuildContext context, int index) {
  Style style = styles[index];
  return Stack(
    alignment: Alignment.center,
    children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30.0,
                  offset: const Offset(10, 15))
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Image(
                image: AssetImage(style.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        style.time.toString() + ' Minutes | ',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        style.students.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Form(
              child: GestureDetector(
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    Icons.play_arrow,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => VideoPlay())),
              ),
            )
          ],
        ),
      ),
    ),
  ]);
}
