import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../provider/lesson_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lições'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
      ),
      body: Consumer<LessonProvider>(
        builder: (context, lessonProvider, child) {
          return ListView.builder(
            itemCount: lessonProvider.lessons.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.book,
                    color: Colors.green.shade800,
                  ),
                  title: Text(
                    lessonProvider.lessons[index].title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/lesson',
                      arguments: lessonProvider.lessons[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
