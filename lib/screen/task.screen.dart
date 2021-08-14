import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';

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
    return new WillPopScope(
        onWillPop: () async => false,
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Awesome List App'),
          centerTitle: true,
        ),
        body: ListView(
          children: List.generate(
            taskList.length,
                (i) {
              return TaskContainer(task: taskList[i], index: i,);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            taskList.add(Task(title: 'title', description: 'description'));
          setState(() {

          });
            },
          child: Icon(Icons.add,
          ),
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
      ),
    ));
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;
final int index;
  TaskContainer({required this.task,required this.index});

  @override
  Widget build(BuildContext context) {
    String? status = task.status;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          border: Border.all(color: Colors.green.shade300),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 2),
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
                  if(status!=null)
                  Text(
                    status,
                    style: TextStyle(fontSize: 20,color: Colors.green)),
                  if(status==null)
                  Text(
                    'Unknown',
                    style: TextStyle(fontSize: 20,color: Colors.red),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: (){
                    print(taskList[index].title);
                    taskList.removeAt(index);
                    print(taskList.length);
                  },
                  icon: Icon(Icons.delete,color: Colors.red,), ),
            ),
          ],
        ),
      ),
    );
  }
}