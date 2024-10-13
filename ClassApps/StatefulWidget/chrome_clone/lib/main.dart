import 'package:chrome_clone/Homepage/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ChromeApp());
}

class ChromeApp extends StatelessWidget {
  const ChromeApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChromeCloneApp(),
    );
  }
}

class ChromeCloneApp extends StatefulWidget {
  const ChromeCloneApp({super.key});

  @override
  State<ChromeCloneApp> createState() => _ChromeCloneAppState();
}

class _ChromeCloneAppState extends State<ChromeCloneApp> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

