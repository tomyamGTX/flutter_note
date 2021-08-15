import 'package:flutter/material.dart';
import 'package:flutter_note/model/task.model.dart';
import 'package:get_storage/get_storage.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> taskList;

  TaskListProvider({required this.taskList});

  update() {
    final box = GetStorage();
    box.write('taskList', taskList.map((e) => e.toMap()).toList());

    final list = box.read('taskList');
    print(list);
    notifyListeners();
  }

  addTask(Task task) {
    taskList.add(task);
    update();
  }

  deleteTask(int index) {
    taskList.removeAt(index);
    update();
  }
}