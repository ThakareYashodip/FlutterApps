import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/LogoAlternative.png",height: 40,width: 80,),
        backgroundColor: Colors.black,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration:  BoxDecoration(
              border: Border.all(width: 2,color: Colors.amber)
            ),
            child: const Center(
              child: Text("SUBSCRIBE",style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold,
              ),),,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
        ],
      ),
      body: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            
          ),
        ),
      ),
    );
  }
}