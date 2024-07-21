import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTasks ? 'No completed tasks yet' : 'No tasks added yet!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
              emptyTasksMessage,
              style: context.textTheme.headlineMedium,
            ))
          : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final task = tasks[index];

                return InkWell(
                  onLongPress: () {
                    //todo: delete task
                    AppAlerts.showDeleteAlertDialog(context, task);
                  },
                  onTap: () async {
                    //TODO show task details
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await BaseWidget.of(context)
                          .dataStore
                          .updateTask(task: task)
                          .then((value) {
                        AppAlerts.displaySnackBar(
                          context,
                          task.isCompleted
                              ? 'Task completed'
                              : 'Task uncompleted',
                        );
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
