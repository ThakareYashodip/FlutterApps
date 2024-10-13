import 'package:flutter/material.dart';

class Testingclass3 extends StatefulWidget {
  const Testingclass3({super.key});

  @override
  State<Testingclass3> createState() => _Testingclass3State();
}

class _Testingclass3State extends State<Testingclass3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Core2web',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_rounded,size: 40,color: Colors.black,)),
        ],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 360,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}