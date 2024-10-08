import 'package:flutter/material.dart';
import 'package:netflix_part1/Authentication/NetFlixLandingPage2.dart';

class NetFlixLandingPage1 extends StatefulWidget {
  const NetFlixLandingPage1({super.key});

  @override
  State<NetFlixLandingPage1> createState() => _NetFlixLandingPage1State();
}

class _NetFlixLandingPage1State extends State<NetFlixLandingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NetFlixLandingPage2()));
      },
      child: Container(
        color: Colors.black,
        child: Center(
          child: Image.network(
            "https://wallpaperaccess.com/full/6075689.png", //netflix logo
            width: 400,
            height: 300,
            fit: BoxFit.fitWidth,
            ),
        ),
      ),
    ),
  );
  }
}