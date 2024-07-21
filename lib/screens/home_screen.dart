import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'July 21 2024',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: colors.surface,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'My Todo List',
                      style: context.textTheme.headlineSmall?.copyWith(
                          color: colors.surface,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
