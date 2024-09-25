import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ToggleColor());
}
class ToggleColor  extends StatefulWidget {
  const ToggleColor({super.key});

  @override
  State createState() => __ToggleColorState();
}

class __ToggleColorState extends State{

  bool changeColor = true ; 
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Toggle Color', style: TextStyle(
            fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold
          ),),
          backgroundColor: changeColor ? Colors.blue : Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child : Container(
            width: 200,
            height: 200,
            color: changeColor ? Colors.black : Colors.blue,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          (changeColor == true )? changeColor = false: changeColor = true ;
          setState(() {});
        },
          backgroundColor: changeColor? Colors.blue : Colors.black,
          child: const Icon(Icons.add , color: Colors.white , size: 30),
        ),
      ),
    );
  }
}