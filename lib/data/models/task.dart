import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/utils/task_category.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String note;
  @HiveField(3)
  String time;
  @HiveField(4)
  String date;
  @HiveField(5)
  TaskCategory category;
  @HiveField(6)
  bool isCompleted;

  factory Task.create({
    required String title,
    required String note,
    required String time,
    required String date,
    required TaskCategory category,
    required bool isCompleted,
  }) =>
      Task(
        id: const Uuid().v1(),
        title: title,
        note: note,
        time: time,
        date: date,
        category: category,
        isCompleted: isCompleted,
      );
}
