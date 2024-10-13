import 'package:daily_flash_2/page1.dart';
import 'package:daily_flash_2/page2.dart';
import 'package:daily_flash_2/page3.dart';
import 'package:daily_flash_2/page4.dart';
import 'package:daily_flash_2/page5.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold5(),
    );
  }
}
