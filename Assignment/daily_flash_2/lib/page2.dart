import 'package:flutter/material.dart';

Widget Scaffold2(){
  return Scaffold(
    body: Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5,color: Colors.red
            )
          )
        ),
       child: const Center(
        child: Text("YASH",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold, 
        ),),
      ),
      ),
    ),
  );
}