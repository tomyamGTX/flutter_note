import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';

class TaskListProvider extends ChangeNotifier{
  List<Task> taskList = [
    Task(title: 'Task 1', description: 'Create App'),
    Task(title: 'Task 2', description: 'Do exercise'),
    Task(title: 'Task 3', description: 'Watch video'),
    Task(title: 'Task 4',description: 'Watch video'),
    Task(title: 'Task 5', description: 'Deploy'),
  ];

  update() {
    notifyListeners();
  }

  addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }
}
