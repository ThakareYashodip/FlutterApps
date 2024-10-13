import 'package:flutter/material.dart';

String? str = "Click Me!";
bool flag1 = true;

Widget Scaffold5(){
  return Scaffold(
    backgroundColor: Colors.black54,
    body: Center(
      child: GestureDetector(
        onTap: (){
          if(flag1 = true){
            flag1 = false;
            str = "Container Pressed";
          }else{
            flag1 = true;
            str = "Click Me";
          }
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 151, 38),
            border: Border.all(color: const Color.fromARGB(255, 215, 37, 64),width: 5),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: Center(
            child: Text(str!,style: const TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white
            ),),
          ),
        ),
      ),
    ),
  );
}