import 'package:flutter/material.dart';
import 'package:flutter_note/screen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Note',
      theme: ThemeData(
textTheme: TextTheme(headline4: TextStyle(color: Colors.indigo) ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Note App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
}}