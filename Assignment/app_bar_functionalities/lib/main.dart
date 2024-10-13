import 'package:app_bar_functionalities/TestingClass1.dart';
import 'package:app_bar_functionalities/TestingClass4.dart';
import 'package:app_bar_functionalities/Testingclass2.dart';
import 'package:app_bar_functionalities/Testingclass3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassAppBar(),
    );
  }
}
class ClassAppBar extends StatefulWidget {
  const ClassAppBar({super.key});

  @override
  State<ClassAppBar> createState() => _ClassAppBarState();
}

class _ClassAppBarState extends State<ClassAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Testingclass5();
  }
}