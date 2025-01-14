import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_employee_app/C2W_E-Commerse-App/View/Authentication/landingPage.dart';
import 'package:flutter/material.dart';

import 'IPL_Player_Info/View/LandingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCEbjt7yNkLPG94n8q-ZmpdO3JpSUvL2Yc",
      appId: "1:419259127964:android:f828162ba4ce86971f3559",
      messagingSenderId: "419259127964",
      projectId: "flutter-firebase-9fbe2",
      storageBucket: "flutter-firebase-9fbe2.firebasestorage.app",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: ECommerseLandingPage(),
    );
  }
}
