import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonProvider extends ChangeNotifier {
  List<Lesson> _lessons = [
    Lesson(title: 'Lição 1', questions: ['Tópico 1', 'Tópico 2']),
    Lesson(title: 'Lição 2', questions: ['Tópico 1', 'Tópico 2']),
  ];

  List<Lesson> get lessons => _lessons;
}
