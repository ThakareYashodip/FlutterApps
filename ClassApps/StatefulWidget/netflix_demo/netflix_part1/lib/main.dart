import 'package:flutter/material.dart';
import 'package:netflix_part1/Authentication/NetFlixLandingPage1.dart';
import 'package:netflix_part1/Authentication/userSelection.dart';
import 'DashBoard/HomeScreen.dart';
import "Authentication/NetFlixLandingPage2.dart";

void main() {
  runApp(const ListBuilders());
}

class ListBuilders extends StatelessWidget {
  const ListBuilders({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetFlix(),
    );
  }
}

class NetFlix extends StatefulWidget {
  const NetFlix({super.key});

  @override
  State createState() => _NetFlix();
}

class _NetFlix extends State {
  @override
  Widget build(BuildContext context) {
    return userSelection();
  }
}
