import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_category.g.dart';

@HiveType(typeId: 1)
enum TaskCategory {
  @HiveField(0)
  education(Icons.school, Colors.blueGrey),
  @HiveField(1)
  health(Icons.favorite, Colors.orange),
  @HiveField(2)
  home(Icons.home, Colors.green),
  @HiveField(3)
  others(Icons.calendar_month_rounded, Colors.purple),
  @HiveField(4)
  personal(Icons.person, Colors.lightBlue),
  @HiveField(5)
  shopping(Icons.shopping_bag, Colors.deepOrange),
  @HiveField(6)
  social(Icons.people, Colors.brown),
  @HiveField(7)
  travel(Icons.flight, Colors.pink),
  @HiveField(8)
  work(Icons.work, Colors.amber);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
