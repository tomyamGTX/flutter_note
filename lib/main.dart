import 'package:flutter/material.dart';
import 'package:flutter_note/screen/home.screen.dart';
import 'package:flutter_note/screen/task.screen.dart';
import 'package:flutter_note/screen/student,screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Note',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/new': (context) => const StudentScreen(),
        '/file': (context) => const TaskScreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: ThemeData(
        textTheme: TextTheme(headline4: TextStyle(color: Colors.indigo) ),
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Note App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
}}