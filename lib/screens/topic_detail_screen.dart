import 'package:flutter/material.dart';
import '../models/topic.dart'; // Ajuste o caminho conforme necessário
import 'lesson_detail_screen.dart';
class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  //Esse aqui também se perdeu no meio do trabalho

  const TopicDetailScreen({required this.topic});

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
      body: ListView.builder(
        itemCount: topic.lessons.length,
        itemBuilder: (context, index) {
          final lesson = topic.lessons[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ListTile(
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
            ),
          );
        },
      ),
    );
  }
}
