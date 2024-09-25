import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:const Text('Indian Flag'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          titleTextStyle: const TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold , 
          ) ,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 5,
                    color: Colors.black
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    color: Colors.white,
                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Ashoka_Chakra.svg/2000px-Ashoka_Chakra.svg.png"),
                  ),
                  Container(
                    height : 40 ,
                    width: 250 ,
                    color: Colors.green ,
                    margin: const EdgeInsets.only(bottom:0),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    child: const Text("Incubators", style: TextStyle(
                      fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold
                    )),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    child : const Text('', style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue
                    )),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}