class Lesson {
  final String title;
  final List<Question> questions;

  Lesson({
    required this.title,
    required this.questions,
  });
}

class Question {
  final String title;
  final String description;

  Question({
    required this.title,
    required this.description,
  });
}
