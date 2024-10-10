import 'package:flutter/material.dart';
import 'package:spotify_clone/Authentication/ForgotPass.dart';
import 'package:spotify_clone/Authentication/LandingPage1.dart';
import 'package:spotify_clone/Authentication/LogInPage.dart';
import 'package:spotify_clone/Authentication/SignUp.dart';

void main() {
  runApp(const YashMusic());
}

class YashMusic extends StatelessWidget {
  const YashMusic({super.key});

  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Spotify(),
    );
  }
}

class Spotify extends StatefulWidget{
  const Spotify({super.key});

  @override
  State createState() => _Spotify();
}

class _Spotify extends State {

  @override
  Widget build(BuildContext context){
    return const LandingPage1();
  }
}