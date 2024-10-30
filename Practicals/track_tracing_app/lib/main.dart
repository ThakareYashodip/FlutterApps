import 'package:flutter/material.dart';
import 'package:track_tracing_app/Descriptionpage.dart';
import 'package:track_tracing_app/trial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Coursepage(),
    );
  }
}
