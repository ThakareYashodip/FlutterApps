import 'package:flutter/material.dart';

class Testingclass1 extends StatefulWidget {
  const Testingclass1({super.key});

  @override
  State<Testingclass1> createState() => _Testingclass1State();
}

class _Testingclass1State extends State<Testingclass1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Class 1'),
        backgroundColor: Colors.amber[300],
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 40,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_rounded,size: 40,color: Colors.white,)),
        ],
      ),
    );
  }
}