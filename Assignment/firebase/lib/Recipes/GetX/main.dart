import 'package:firebase/Recipes/GetX/HomeScreen.dart';
import 'package:firebase/Recipes/GetX/LoginScreen.dart';
import 'package:firebase/Recipes/GetX/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Global Controller Demo',
      home: HomeScreen(),
      routes: {
        '/profile': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
