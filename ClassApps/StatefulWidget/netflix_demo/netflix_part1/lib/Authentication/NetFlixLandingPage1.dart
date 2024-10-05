import 'package:flutter/material.dart';

Scaffold NetFlixLandingPage1() {
  return Scaffold(
    body: Container(
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
  );
}