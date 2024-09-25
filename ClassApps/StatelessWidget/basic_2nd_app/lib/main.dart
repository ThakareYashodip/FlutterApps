import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("FLUTTER"),
            centerTitle: true,
            backgroundColor: Colors.lime,
            titleTextStyle: const TextStyle(
              fontSize: 30,color: Colors.black,fontWeight: FontWeight.w700,
            ),
          ),
        ),
    );
  }
}
