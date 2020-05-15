import 'package:flutter/cupertino.dart';

class Task  {
  final String titleTask;
  bool isCompleted;

  Task({this.titleTask, this.isCompleted = false});

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }
}
