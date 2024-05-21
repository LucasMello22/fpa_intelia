import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonProvider extends ChangeNotifier {
  List<Lesson> _lessons = [
    Lesson(title: 'Lição 1', questions: ['Pergunta 1', 'Pergunta 2']),
    Lesson(title: 'Lição 2', questions: ['Pergunta 1', 'Pergunta 2']),
  ];

  List<Lesson> get lessons => _lessons;
}
