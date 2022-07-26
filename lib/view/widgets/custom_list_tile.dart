import 'package:flutter/material.dart';
import 'package:todo_app_with_provider/constant/themes.dart';

class CustomListTile extends StatelessWidget {
  bool isChecked;
  String taskTitle;
  final void Function(bool?)? checkboxChange;
  final void Function() listTileDelete;

  CustomListTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
    required this.listTileDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: AppTheme.tealColor,
        value: isChecked,
        onChanged: checkboxChange,
      ),
      onLongPress: listTileDelete,
    );
  }
}