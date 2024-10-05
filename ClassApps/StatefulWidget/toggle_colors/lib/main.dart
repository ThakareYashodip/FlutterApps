

import 'package:flutter/material.dart';

void main() {
  runApp(const Aspectratio()); 
}
class Aspectratio extends StatefulWidget {
  const Aspectratio({super.key});

  @override
  State<Aspectratio> createState() => _AspectratioState();
}

class _AspectratioState extends State<Aspectratio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aspect Ratio" , style: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 400,
            width: 400,
            color: Colors.red,
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjC-BFbuM6NA3t5irWhuhtbX4x0lJpeFcbw&s",
            fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}