import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/utils/utils.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.surface,
        ),
      ),
    ));
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: const Text('NO'),
    );

    Widget deleteButton = TextButton(
      onPressed: () async {
        BaseWidget.of(context).dataStore.deleteTask(task: task).then((value) {
          AppAlerts.displaySnackBar(context, 'Task deleted successfully');
          context.pop();
        });
      },
      child: const Text('YES'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    await showDialog(context: context, builder: (ctx) => alert);
  }
}
