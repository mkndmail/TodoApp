import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final Function onToggle;
  final bool isChecked;
  final Function onDelete;
  TaskTile({this.title, this.isChecked, this.onToggle, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onDelete,
      title: Text(title,
          style: TextStyle(
              decoration: isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: onToggle),
    );
  }
}
