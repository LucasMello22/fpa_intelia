import 'package:flutter/material.dart';
import '../models/lesson.dart';

//Não sei mais pra que eu estou usando esse arquivo

class LessonProvider extends ChangeNotifier {
  List<Lesson> _lessons = [
    Lesson(
      title: 'Introdução',
      questions: [
        Question(
          title: 'Tópico 1',
          description: '''
Introdução
''',
        ),
        Question(
          title: 'Tópico 2',
          description: '''
Inteligencia artificial?
''',
        ),
        // Adicione mais tópicos se necessário
      ],
    ),
    Lesson(
      title: 'Segunda Lição',
      questions: [
        Question(
          title: 'Tópico 3',
          description: '''
Conteúdo do Tópico 3
''',
        ),
        // Adicione mais tópicos se necessário
      ],
    ),
    // Adicione mais lições se necessário
  ];

  List<Lesson> get lessons => _lessons;

  Lesson findById(String title) {
    return _lessons.firstWhere((lesson) => lesson.title == title);
  }
}
