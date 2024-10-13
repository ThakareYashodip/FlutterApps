import 'package:flutter/material.dart';


Widget Scaffold3(){
  return Scaffold(
    body: Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 197, 22),
          border: Border.all(color: const Color.fromARGB(255, 255, 19, 2) , width: 5),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
        ),
      ),
    ),
  );
}