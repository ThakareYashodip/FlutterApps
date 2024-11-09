import 'package:flutter/material.dart';
import 'package:plants_app/home.dart';
import 'package:plants_app/loginPage.dart';
import 'package:plants_app/verification.dart';
import './getStarted.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}
