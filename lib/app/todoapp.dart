import 'package:flutter/material.dart';
import 'package:todoapp/config/theme/theme.dart';
import 'package:todoapp/screens/screens.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.light,
    );
  }
}
