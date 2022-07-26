import 'package:flutter/material.dart';
import 'package:todo_app_with_provider/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "go shopping"),
    Task(name: "by a gift"),
    Task(name: "repair the car"),
  ];

  void addTasks(String newTaskTitle) {
    tasks.add(
      Task(name: newTaskTitle),
    );
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deletTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
