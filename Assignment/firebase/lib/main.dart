import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/MyController.dart';
import 'package:firebase/Responsive_portfolio/View/dashboard_portfolio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => MyController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCEbjt7yNkLPG94n8q-ZmpdO3JpSUvL2Yc',
        appId: '1:419259127964:android:f828162ba4ce86971f3559',
        projectId: 'flutter-firebase-9fbe2',
        messagingSenderId: '419259127964',
        storageBucket: 'flutter-firebase-9fbe2.firebasestorage.app'),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Utilities.init(context);
    return GetMaterialApp(
      title: 'Portfolio',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const DashBoardPortfolio(),
    );
  }
}
