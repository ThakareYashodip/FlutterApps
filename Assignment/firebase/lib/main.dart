import 'package:firebase/FirebaseLearning/dashboard.dart';
import 'package:firebase/FirebaseLearning/login.dart';
import 'package:firebase/Recipes/UI/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipesAPI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}
