import 'package:flutter/material.dart';
import '../models/topic.dart';

class TopicProvider with ChangeNotifier {
  List<Topic> _topics = [
    Topic(
      title: 'Introdução',
      description: 'Descrição da Introdução',
      lessons: [
        Lesson(
          title: 'Lição 1',
          content: 'Conteúdo da Lição 1 da Introdução',
        ),
        Lesson(
          title: 'Lição 2',
          content: 'Conteúdo da Lição 2 da Introdução',
        ),
      ],
    ),
    Topic(
      title: 'Segunda Lição',
      description: 'Descrição da Segunda Lição',
      lessons: [
        Lesson(
          title: 'Lição 1',
          content: 'Conteúdo da Lição 1 da Segunda Lição',
        ),
      ],
    ),
    // Adicione mais tópicos conforme necessário
  ];

  List<Topic> get topics => _topics;

  Topic findByTitle(String title) {
    return _topics.firstWhere((topic) => topic.title == title);
  }
}
