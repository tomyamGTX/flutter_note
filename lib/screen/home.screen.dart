import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note/model/task.model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome List App'),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(
          taskList.length,
              (index) {
            return TaskContainer(task: taskList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add,size: 50),
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;

  TaskContainer({this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              task.description,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Status : ',
                  style: TextStyle(fontSize: 20),
                ),
                if(task.status=='Incomplete')
                Text(
                  task.status,
                  style: TextStyle(fontSize: 20,color: Colors.red)),
                if(task.status=='Complete')
                Text(
                  task.status,
                  style: TextStyle(fontSize: 20,color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}