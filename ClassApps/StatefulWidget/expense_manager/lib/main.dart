import 'package:expense_manager/view/login/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
