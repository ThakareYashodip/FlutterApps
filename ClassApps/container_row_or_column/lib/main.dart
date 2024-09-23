import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Row"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: /*Column*/Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width:100,
                height:100,
                color: Colors.amber,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color:Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
