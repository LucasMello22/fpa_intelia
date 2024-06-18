class Topic {
  final String title;
  final String description;
  final List<Lesson> lessons;  // Adicionando a lista de lições para cada tópico

  Topic({required this.title, required this.description, required this.lessons});
}

class Lesson {
  final String title;
  final String content;

  Lesson({required this.title, required this.content});
}
