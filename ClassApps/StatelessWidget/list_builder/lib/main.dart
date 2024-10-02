import 'package:flutter/material.dart';

void main() {
  runApp(const ListBuilder());
}

class ListBuilder extends StatelessWidget {
  const ListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListBuilder",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 30,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Text(
              "Item $index",
              style: const TextStyle(fontSize: 20 , 
              color: Colors.black, fontWeight: FontWeight.bold), 
            );
          },
        ),
      ),
    );
  }
}
