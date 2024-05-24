import 'package:flutter/material.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String topicTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(topicTitle),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: Center(
        child: Text(
          'Conteúdo do $topicTitle',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
