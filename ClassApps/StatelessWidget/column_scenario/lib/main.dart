import 'package:flutter/material.dart';

void main(){
  runApp(const ColumnScenario());
}
class ColumnScenario extends StatelessWidget {
  const ColumnScenario({super.key});

  @override
  Widget build(BuildContext context) {
    print("Height : ${MediaQuery.of(context).size.height}");
    print("Weight : ${MediaQuery.of(context).size.width}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Space Parameters",style: TextStyle(
            fontWeight: FontWeight.bold , color: Colors.white , fontSize: 40
          ), ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("Space" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
                  ),
                ),
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.orange,
                  child: const Center(
                    child: Text("Around" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("Space" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
                  ),
                ),
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.orange,
                  child: const Center(
                    child: Text("Evenly" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("Space" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
                  ),
                ),
                Container(
                  height: 250,
                  width: 100,
                  color: Colors.orange,
                  child: const Center(
                    child: Text("Between" , style: TextStyle(
                                fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20
                              ), ),
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