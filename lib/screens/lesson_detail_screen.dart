import 'package:flutter/material.dart';
import '../models/topic.dart'; // Ajuste o caminho conforme necessário

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              lesson.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10.0),
            Text(
              lesson.content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            // Adicione mais widgets aqui para exibir o conteúdo da lição
          ],
        ),
      ),
    );
  }
}
