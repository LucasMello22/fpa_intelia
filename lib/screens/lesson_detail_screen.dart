import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/topic.dart';

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (lesson.youtubeUrl != null)
              YoutubeVideoWidget(youtubeUrl: lesson.youtubeUrl!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lesson.content,
                style: TextStyle(fontSize: 15.0), // Ajuste o tamanho da fonte aqui
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeVideoWidget extends StatefulWidget {
  final String youtubeUrl;

  YoutubeVideoWidget({required this.youtubeUrl});

  @override
  _YoutubeVideoWidgetState createState() => _YoutubeVideoWidgetState();
}

class _YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null
        ? YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      onReady: () {
        print('Player is ready.');
      },
      onEnded: (metadata) {
        _controller.seekTo(Duration(seconds: 0));
      },
    )
        : Center(
      child: CircularProgressIndicator(),
    );
  }
}
