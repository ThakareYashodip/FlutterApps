// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travelling_buddy/page1.dart';
import 'package:travelling_buddy/page2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Travel_Buddy(),
    );
  }
}

// ignore: camel_case_types
class Travel_Buddy extends StatefulWidget {
  const Travel_Buddy({super.key});

  @override
  State<Travel_Buddy> createState() => __Travel_BuddyState();
}

class __Travel_BuddyState extends State<Travel_Buddy> {
  @override
  Widget build(BuildContext context) {
    return const Page2();
  }
}
