import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/topic.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  _LessonDetailScreenState createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool isPlaying = false;
  final TextToSpeech textToSpeech = TextToSpeech();

  void togglePlayPause() async {
    if (isPlaying) {
      await textToSpeech.stop();
    } else {
      await textToSpeech.speak(widget.lesson.content);
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void initState() {
    super.initState();
    textToSpeech.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    textToSpeech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.lesson.youtubeUrl != null)
              YoutubeVideoWidget(youtubeUrl: widget.lesson.youtubeUrl!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.lesson.content,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: togglePlayPause,
                    child: Text(isPlaying ? 'Parar' : 'Ouvir conteúdo'),
                  ),
                ],
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

class TextToSpeech {
  final FlutterTts flutterTts = FlutterTts();

  TextToSpeech() {
    flutterTts.setLanguage("pt-BR");
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }

  void setCompletionHandler(VoidCallback handler) {
    flutterTts.setCompletionHandler(handler);
  }
}
