import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTask(),
      builder: (ctx, Box<Task> box, Widget? child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: deviceSize.height * 0.3,
                    width: deviceSize.width,
                    color: colors.primary,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayWhiteText(
                          text: 'July 21 2024',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        DisplayWhiteText(
                          text: 'My Todo List',
                          fontSize: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTasks(
                          tasks: base.dataStore.getIncompleteTasks(),
                        ),
                        const Gap(20),
                        Text(
                          'Completed Tasks',
                          style: context.textTheme.headlineMedium,
                        ),
                        const Gap(20),
                        ListTasks(
                          tasks: base.dataStore.getCompletedTasks(),
                          isCompletedTasks: true,
                        ),
                        const Gap(20),
                        ElevatedButton(
                          onPressed: () =>
                              context.push(RouteLocation.createTask),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayWhiteText(text: 'Add New Task'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
