import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        appBar: AppBar(title: Text('Awesome List App'),),
        body: ListView(
          children: [
            CustomText(text: '1'),
            Text('2'),
            Text('3')
          ],
        ),
    );
  }
}
class CustomText extends StatelessWidget {
  final String text;

  CustomText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}


List<String> TaskList=['Task1','Task2', 'Task3'];