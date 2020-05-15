import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/model/task_data.dart';
import 'package:todoapp/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.totalTasks,
            itemBuilder: (context, i) {
              var currentTask = taskData.allTasks[i];
              return TaskTile(
                title: currentTask.titleTask,
                isChecked: currentTask.isCompleted,
                onToggle: (value) {
                  taskData.updateTask(currentTask);
                },
                onDelete: (){
                  confirmDelete(context,taskData,currentTask);
                },
              );
            });
      },
    );
  }
}

void confirmDelete(BuildContext context,TaskData taskData, Task currentTask) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete task'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to delete this task?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        FlatButton(
            child: Text('Approve'),
            onPressed: () {
              taskData.deleteTask(currentTask);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
