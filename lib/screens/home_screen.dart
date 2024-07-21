import 'package:flutter/material.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/utils/task_category.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                    const ListTasks(
                      tasks: [
                        Task(
                          title: 'title 2',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.education,
                          isCompleted: false,
                        ),
                        Task(
                          title: 'title jsl 4',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.personal,
                          isCompleted: false,
                        ),
                        Task(
                          title: 'title',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.work,
                          isCompleted: false,
                        )
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Completed Tasks',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const ListTasks(
                      tasks: [
                        Task(
                          title: 'title 2',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.education,
                          isCompleted: true,
                        ),
                        Task(
                          title: 'title jsl 4',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.education,
                          isCompleted: true,
                        ),
                        Task(
                          title: 'title',
                          note: 'note',
                          time: '10:40',
                          date: 'Aug 23',
                          category: TaskCategory.education,
                          isCompleted: true,
                        )
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {},
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
  }
}
