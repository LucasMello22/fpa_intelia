import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Lesson lesson = ModalRoute.of(context)!.settings.arguments as Lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: ListView.builder(
        itemCount: lesson.questions.length,
        itemBuilder: (context, index) {
          final question = lesson.questions[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ListTile(
              title: Text(
                'Tópico ${index + 1}',
                style: Theme.of(context).textTheme.bodyText2,

              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/topic',
                  arguments: 'Tópico ${index + 1}',
                );
              },
            ),
          );
        },
      ),
    );
  }
}
