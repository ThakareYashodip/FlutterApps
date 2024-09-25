import 'package:flutter/material.dart';

void main(){
  runApp(const CounterApp());
}
class CounterApp extends StatefulWidget{
  const CounterApp({super.key});

  @override
  State createState() => _CounterAppState(); 
}

class _CounterAppState extends State{
  
  int count = 0 ;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App', style: TextStyle(
            fontSize: 25, color: Colors.white ,
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text("$count", style: const TextStyle(
            fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold
          ),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          count++;
          if(count > 50){
            count = 0 ;
          }
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),),
        ),
      );
  }
}