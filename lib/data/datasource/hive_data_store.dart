import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';

class HiveDataStore {
  static const boxName = 'taskBox';

  final Box<Task> box = Hive.box<Task>(boxName);

  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> deleteTask({required Task task}) async {
    await task.delete();
  }

  Future<void> updateTask({required Task task}) async {
    await task.save();
  }

  List<Task> getAllTasks() {
    return box.values.toList();
  }

  List<Task> getCompletedTasks(WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    return box.values
        .where((task) =>
            task.isCompleted &&
            Helpers.isTaskFromSelectedDate(task, selectedDate))
        .toList();
  }

  List<Task> getIncompleteTasks(WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    return box.values
        .where((task) =>
            !task.isCompleted &&
            Helpers.isTaskFromSelectedDate(task, selectedDate))
        .toList();
  }

  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}
