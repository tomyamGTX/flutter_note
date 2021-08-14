import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {

  const TaskScreen();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index==0)
      Navigator.pushNamed(context, '/home');
    if(index==2)
      Navigator.pushNamed(context, '/new');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      create: (context) => TaskListProvider(),
      child: Builder(
        builder: (context) {
          return new WillPopScope(
            onWillPop: () async => false,
            child: MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Awesome List App'),
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
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.indigo,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.file_copy),
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
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    final taskListProvider =
                    Provider.of<TaskListProvider>(context, listen: false);
                    final taskList = taskListProvider.taskList;
                    final newTask = Task(
                        title: 'Task ${taskList.length + 1}',
                        description: 'Task ${taskList.length + 1} Description');
                    taskListProvider.addTask(newTask);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          );
        },
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
                icon: Icon(Icons.edit),
                onPressed: () {
                  // print(taskList[index].title);
                  // taskList.removeAt(widget.index);
                  // print(taskList.length);
                },
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