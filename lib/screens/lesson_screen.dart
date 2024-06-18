import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/topic.dart'; // Ajuste o caminho conforme necessário
import '../provider/topic_provider.dart'; // Ajuste o caminho conforme necessário
import 'lesson_detail_screen.dart'; // Ajuste o caminho conforme necessário

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Topic> topics = Provider.of<TopicProvider>(context).topics;

    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ExpansionTile(
              title: Text(
                topic.title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              children: topic.lessons.map((lesson) {
                return ListTile(
                  title: Text(
                    lesson.title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonDetailScreen(lesson: lesson),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
