import 'package:flutter/material.dart';
import 'package:todo_app_with_provider/models/task_data.dart';
import 'package:todo_app_with_provider/view/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_provider/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, pro, _) {
        return ListView.builder(
          itemCount: pro.tasks.length,
          itemBuilder: ((context, index) {
            return CustomListTile(
              isChecked: pro.tasks[index].isDone,
              taskTitle: pro.tasks[index].name,
              checkboxChange: (newVal) {
                pro.updateTasks(
                  pro.tasks[index],
                );
              },
              listTileDelete: () {
                pro.deletTask(
                  pro.tasks[index],
                );
              },
            );
          }),
        );
      },
    );
  }
}
