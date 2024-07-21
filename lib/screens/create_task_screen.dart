import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/datasource/hive_data_store.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task Title',
                hintText: 'Task Title',
                controller: _titleController,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                title: 'Note',
                hintText: 'Task notes',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(60),
              ElevatedButton(
                onPressed: () => _createTask(),
                child: const DisplayWhiteText(text: 'Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final base = BaseWidget.of(context);
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty')),
      );
    } else {
      final task = Task.create(
        title: title,
        note: note,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        isCompleted: false,
      );

      base.dataStore.addTask(task: task).then((value) {
        AppAlerts.displaySnackBar(context, 'Task added successfully');

        context.go(RouteLocation.home);
      });
    }
  }
}
