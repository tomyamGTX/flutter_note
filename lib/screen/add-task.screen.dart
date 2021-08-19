import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
AddTaskScreen({Key? key}) : super(key: key);

final titleTextController = new TextEditingController();
final descriptionTextController = new TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Add New Task' ,
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 2)
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: Theme(
      data: ThemeData(
          accentColor: Colors.orange,
          primarySwatch: Colors.orange,
          colorScheme: ColorScheme.light(
              primary: Colors.green
          )
      ),
  child:Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: titleTextController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      icon: Icon(Icons.title)
                  ),
                ),
                TextField(
                  controller: descriptionTextController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      focusColor: Colors.green,
                      icon: Icon(Icons.info)
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: Text('ADD TASK'),
                onPressed: () {
                  final task = Task(
                      description: descriptionTextController.text,
                      title: titleTextController.text);
                  Provider.of<TaskListProvider>(context, listen: false)
                      .addTask(task);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),)
  );
}
}
