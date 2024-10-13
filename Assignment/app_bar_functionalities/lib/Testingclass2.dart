import 'package:flutter/material.dart';

class Testingclass2 extends StatefulWidget {
  const Testingclass2({super.key});

  @override
  State<Testingclass2> createState() => _Testingclass2State();
}

class _Testingclass2State extends State<Testingclass2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Class 2'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_rounded,size: 40,color: Colors.black,)),
        ],
      ),
    );
  }
}