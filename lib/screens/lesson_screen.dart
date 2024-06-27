import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/topic.dart';
import '../provider/topic_provider.dart';
import 'lesson_detail_screen.dart';

class LessonScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/image1.png',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    List<Topic> topics = Provider.of<TopicProvider>(context).topics;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lições'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: imgList.map((item) => Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ),
            )).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5.0,
                  child: ExpansionTile(
                    title: Text(
                      topic.title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    children: topic.lessons.map((lesson) {
                      return ListTile(
                        title: Text(
                          lesson.title,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonDetailScreen(lesson: lesson),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
