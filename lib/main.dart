import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/app/todoapp.dart';
import 'package:todoapp/data/datasource/hive_data_store.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/utils/utils.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter(TaskCategoryAdapter());

  await Hive.openBox<Task>(HiveDataStore.boxName);

  runApp(
    ProviderScope(
      child: BaseWidget(
        child: const TodoApp(),
      ),
    ),
  );
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;
  final HiveDataStore dataStore = HiveDataStore();

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    }
    throw StateError('Could not find BaseWidget');
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
