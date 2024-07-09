class Topic {
  final String title;
  final String description;
  final List<Lesson> lessons;


  Topic({required this.title, required this.description, required this.lessons});
}

class Lesson {
  final String title;
  final String content;
  final String? youtubeUrl;

  Lesson({required this.title, required this.content, this.youtubeUrl,});
}
