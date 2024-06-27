import 'package:flutter/material.dart';
import '../models/topic.dart';

class TopicProvider with ChangeNotifier {
  List<Topic> _topics = [
    Topic(
      title: 'Introdução',
      description: 'Descrição da Introdução',
      lessons: [
        Lesson(
          title: 'O que é IA?',
          content: 'Inteligência Artificial (IA) é um campo da ciência da computação que se concentra no desenvolvimento de sistemas capazes de realizar tarefas que normalmente exigiriam inteligência humana. Isso inclui habilidades como aprendizado, raciocínio, percepção, reconhecimento de padrões, tomada de decisões e compreensão de linguagem natural. A IA pode ser dividida em duas categorias principais: IA estreita, que é projetada para realizar uma tarefa específica (como reconhecimento facial ou recomendação de filmes), e IA geral, que visa ter uma capacidade cognitiva humana mais ampla e adaptável. A IA está presente em diversas áreas, como assistentes virtuais, veículos autônomos, diagnósticos médicos, entre outras, transformando a forma como interagimos com a tecnologia e o mundo ao nosso redor.',
          youtubeUrl: 'https://www.youtube.com/watch?v=J4RqCSD--Dg',
        ),
        Lesson(
          title: 'As maquinas aprendem?',
          content: 'As máquinas podem aprender através de técnicas de Inteligência Artificial, como o aprendizado de máquina (machine learning). Este processo envolve algoritmos que permitem às máquinas melhorar seu desempenho em determinadas tarefas à medida que são expostas a mais dados. Em vez de serem explicitamente programadas para cada ação, as máquinas podem ajustar suas próprias respostas com base nos padrões identificados nos dados. Isso inclui reconhecer padrões, fazer previsões e tomar decisões, tornando possível a automação e a personalização em uma variedade de aplicações, desde recomendações de produtos até diagnósticos médicos e controle de processos industriais',
          youtubeUrl: 'https://www.youtube.com/watch?v=QghjaS0WQQU',
        ),
      ],
    ),
    Topic(
      title: 'A inteligência humana',
      description: 'Descrição da Segunda Lição',
      lessons: [
        Lesson(
          title: 'Lição 1',
          content: 'Conteúdo da Lição 1 da Segunda Lição',
        ),
      ],
    ),
    Topic(
      title: 'Terceira Lição',
      description: 'Descrição da Terceira Lição',
      lessons: [
        Lesson(
          title: 'Lição 1',
          content: 'Conteúdo da Lição 1 da Terceira Lição',
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
