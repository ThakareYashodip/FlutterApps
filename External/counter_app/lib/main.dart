import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter App'), centerTitle: true),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text("$counter", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            const SizedBox(height: 200),
            Row(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    counter--;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),

                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Text("-", style: TextStyle(fontSize: 40)),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    counter++;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,

                    child: Text("+", style: TextStyle(fontSize: 40)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
