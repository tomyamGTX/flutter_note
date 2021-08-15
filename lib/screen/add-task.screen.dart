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
      title: Text('Add New Task' ,style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: Padding(
      padding: const EdgeInsets.all(12.0),
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
              labelText: 'Description',focusColor: Colors.green,
           icon: Icon(Icons.info)
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              final task = Task(
                  description: descriptionTextController.text,
                  title: titleTextController.text);
              Provider.of<TaskListProvider>(context, listen: false)
                  .addTask(task);
              Navigator.pop(context);
            },
            child: Text('Add Task',style: TextStyle(letterSpacing: 3,color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}
}
