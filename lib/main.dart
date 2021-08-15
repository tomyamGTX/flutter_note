import 'package:flutter/material.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:flutter_note/screen/add-task.screen.dart';
import 'package:flutter_note/screen/home.screen.dart';
import 'package:flutter_note/screen/task.screen.dart';
import 'package:flutter_note/screen/student,screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'model/task.model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final taskList = box.read('taskList');
    final List<Task> list = taskList != null
        ? List.from((taskList as List<dynamic>).map((e) => Task.fromMap(e)))
        : [];
    print(list);
    final taskListProvider = TaskListProvider(taskList: list);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskListProvider>.value(value: taskListProvider)
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
          routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/student': (context) => const StudentScreen(),
        '/file': (context) => const TaskListScreen(),
        '/home': (context) => const HomeScreen(),
        '/addTask': (context) => AddTaskScreen(),
        },
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}