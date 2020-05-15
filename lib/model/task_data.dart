import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoapp/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(titleTask: 'Buy Eggs', isCompleted: false),
    Task(titleTask: 'Buy Milk', isCompleted: false),
    Task(titleTask: 'Pay Bill', isCompleted: false),
  ];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  int get totalTasks => _tasks.length;


  UnmodifiableListView<Task> get allTasks=> UnmodifiableListView(_tasks);

  void updateTask(Task task){
    task.toggleIsCompleted();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}
