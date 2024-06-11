import 'package:flutter/material.dart';
import '../models/topic.dart';

class TopicProvider extends ChangeNotifier {
  List<Topic> _topics = [
    Topic(
      title: 'Introdução',
      description: '''
Nos últimos anos, a tecnologia tem avançado a passos largos, transformando radicalmente a maneira como vivemos e interagimos com o mundo ao nosso redor. Entre as inovações mais impactantes e revolucionárias estão o Machine Learning e a Inteligência Artificial (IA). Esses campos não apenas têm o potencial de alterar setores inteiros da economia, mas também estão mudando a forma como enfrentamos problemas complexos, desde a previsão de desastres naturais até o diagnóstico precoce de doenças.

Machine Learning (ML), ou Aprendizado de Máquina, refere-se a uma sub-área da Inteligência Artificial que permite que sistemas de computador aprendam e melhorem a partir da experiência, sem serem explicitamente programados para tal. Em vez de seguirem instruções rígidas, os algoritmos de ML identificam padrões nos dados e fazem previsões ou decisões baseadas nesses padrões. Isso pode variar desde simples recomendações de produtos até complexas análises preditivas em tempo real.

Inteligência Artificial (IA), por sua vez, é um campo mais amplo que engloba qualquer técnica que permita que os computadores imitem capacidades humanas, como aprendizado, raciocínio e adaptação. A IA abrange uma variedade de sub-disciplinas, incluindo ML, processamento de linguagem natural, visão computacional, e robótica. Enquanto o ML é frequentemente a tecnologia subjacente que alimenta muitas aplicações de IA, a IA também incorpora outros métodos e tecnologias para criar sistemas mais robustos e versáteis.
''',
    ),
    Topic(
      title: 'Inteligência Artificial?',
      description: '''
Conteúdo do Tópico 2
''',
    ),
    Topic(
      title: 'Como as Maquinas Aprendem',
      description: '''
Conteúdo do Tópico 3
''',
    ),
    // Adicione mais tópicos se necessário
  ];

  List<Topic> get topics => _topics;

  void addTopic(Topic topic) {
    _topics.add(topic);
    notifyListeners();
  }

  void removeTopic(Topic topic) {
    _topics.remove(topic);
    notifyListeners();
  }
}