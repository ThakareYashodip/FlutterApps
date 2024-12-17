// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:imagepick/loginScreen.dart';
import 'package:imagepick/playerInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sharedPreference.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // ignore: unused_element
    void _delayed(){
      customSharedPreference.getData();
      if(customSharedPreference.isLogic! == true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PlayersInfo()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }

    return const Scaffold(
      body: Center(
        child: Text("YASHODIP"),
      ),
    );
  }
}