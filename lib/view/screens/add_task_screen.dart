import 'package:flutter/material.dart';
import 'package:todo_app_with_provider/constant/spaces.dart';
import 'package:todo_app_with_provider/constant/themes.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_provider/models/task.dart';
import 'package:todo_app_with_provider/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(
        30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.floatingactionButtonColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (val) {
              newTaskTitle = val;
            },
          ),
          AppSizedBox.sizedBoxheight30,
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTasks(newTaskTitle!);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: AppTheme.tealColor,
              primary: AppTheme.whiteColor,
            ),
            child: const Text(
              'Add',
            ),
          )
        ],
      ),
    );
  }
}
