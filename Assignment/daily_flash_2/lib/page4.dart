import 'package:flutter/material.dart';

Widget Scaffold4(){
  return Scaffold(
    body: Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 200, 200),
          border: Border.all(color: const Color.fromARGB(255, 196, 69, 60),width: 5),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        child: const Text("YASH",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold, 
        ),),
      ),
    ),
  );
}