import 'package:flutter/material.dart';
import 'package:todo_app_with_provider/constant/spaces.dart';
import 'package:todo_app_with_provider/constant/themes.dart';
import 'package:todo_app_with_provider/models/task.dart';
import 'package:todo_app_with_provider/models/task_data.dart';
import 'package:todo_app_with_provider/view/screens/add_task_screen.dart';
import 'package:todo_app_with_provider/view/widgets/custom_tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(
                    (newTaskTitle) {
                      Provider.of<TaskData>(context).tasks.toString();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            );
          },
          backgroundColor: AppTheme.floatingactionButtonColor,
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
      backgroundColor: AppTheme.backgroundcolor,
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.playlist_add_check,
                    color: AppTheme.whiteColor,
                    size: 40,
                  ),
                ),
                AppSizedBox.sizedBoxWidth20,
                Text(
                  "ToDayDo",
                  style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            AppSizedBox.sizedBoxheight15,
            Text(
              "${Provider.of<TaskData>(context).tasks.length} Tasks",
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 18,
              ),
            ),
            AppSizedBox.sizedBoxheight20,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: TasksList(
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
