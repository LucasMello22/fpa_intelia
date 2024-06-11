import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/topic.dart'; // Ajuste o caminho conforme necessário
import '../provider/topic_provider.dart'; // Ajuste o caminho conforme necessário

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Topic> topics = Provider.of<TopicProvider>(context).topics;

    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,

      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ListTile(
              title: Text(
                topic.title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onTap: () {
                // Aqui você pode navegar para a tela de conteúdo do tópico
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicContentScreen(topic: topic),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TopicContentScreen extends StatelessWidget {
  final Topic topic;

  const TopicContentScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              topic.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10.0),
            Text(
              topic.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            // Aqui você pode adicionar mais widgets para exibir o conteúdo do tópico
          ],
        ),
      ),
    );
  }
}
