import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';

class TaskScreen extends StatefulWidget {

  const TaskScreen({Key key}) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Task',
      style: optionStyle,
    ),
    Text(
      'Index 2: Student',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

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
                (index) {
              return TaskContainer(task: taskList[index]);
            },
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

  TaskContainer({this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          border: Border.all(color: Colors.green.shade300),
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
                  'Status = ',
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