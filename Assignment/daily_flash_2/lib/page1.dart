import 'package:flutter/material.dart';

Widget Scaffold1() {
  return Scaffold(
    body: Center(
        child: Container(
      height: 200,
      width: 200,
      decoration:  BoxDecoration(
        border: Border.all(
          width: 2,color: Colors.red
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: const Text("YASH",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold, 
        ),),
      ),
    )),
  );
}
