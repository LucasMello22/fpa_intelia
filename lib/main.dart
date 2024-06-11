import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lesson_screen.dart';
import 'screens/topic_screen.dart';
import 'screens/user_screen.dart';
import 'provider/lesson_provider.dart';
import 'provider/topic_provider.dart';

void main() {
  runApp(IntelIAApp());
}

class IntelIAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LessonProvider()),
        ChangeNotifierProvider(create: (context) => TopicProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IntelIA',
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 16.0),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/lesson': (context) => LessonScreen(),
          '/topic': (context) => TopicScreen(),
          '/user': (context) => UserScreen(),
        },
      ),
    );
  }
}
