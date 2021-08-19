import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:flutter_note/screen/add-task.screen.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen();

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      if(index==0)
        Navigator.pushNamed(context, '/home');
      if(index==2)
        Navigator.pushNamed(context, '/student');
    }
    return new WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Task List',
            style: TextStyle(
            letterSpacing: 2,
            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Consumer<TaskListProvider>(
            builder: (context, taskListProvider, child) {
              final taskList = taskListProvider.taskList;
              return ListView(
                children: List.generate(
                  taskList.length,
                      (i) {
                    return TaskContainer(
                      task: taskList[i],
                      index: i,
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.pushNamed(context, '/addTask');
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.indigo,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Task',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Student',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.limeAccent,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;
  final int index;

  TaskContainer({required this.task, required this.index});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  final taskListProvider =
                  Provider.of<TaskListProvider>(context, listen: false);
                  taskListProvider.deleteTask(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
