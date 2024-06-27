import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/topic.dart';
import '../provider/topic_provider.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);
    final topics = topicProvider.topics;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tópicos'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return ListTile(
            title: Text(topic.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicDetailScreen(topic: topic),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;

  TopicDetailScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lições'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            topic.description,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
