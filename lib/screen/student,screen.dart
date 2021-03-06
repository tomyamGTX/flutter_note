import 'package:flutter/material.dart';
import 'package:flutter_note/model/student.model.dart';

class StudentScreen extends StatefulWidget {

  const StudentScreen();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index==0)
      Navigator.pushNamed(context, '/home');
    if(index==1)
      Navigator.pushNamed(context, '/file');
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Student List',
          style: TextStyle(
          letterSpacing: 2,
          ),
          ),
          centerTitle: true,
        ),
        body: Container(
          // child: GridView.count(
          //   crossAxisCount: 2,
          //   children: List.generate(
          //     studentList.length,
          //         (index) {
          //       return StudentContainer(student: studentList[index]);
          //       },
          //   ),
          // ),
        ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pushNamed(context, '/addStudent');
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
    ));
  }
}

class StudentContainer extends StatelessWidget {
  final Student student;
  final int index;
  StudentContainer({required this.student, required this.index});

  @override
  Widget build(BuildContext context) {
    String? age= student.age;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          border: Border.all(color: Colors.purple.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10),
              if(age!=null)
              Text(age,
                style: TextStyle(fontSize: 20),
              ),
              if(age==null)
                Text('Age is unknown',
                  style: TextStyle(fontSize: 20),
                ),
              SizedBox(height: 10),
              Text(student.address,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Center(child: ElevatedButton(
                  onPressed: (){},
                child: Text('Delete',
                  style: TextStyle(letterSpacing: 3),
              ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
