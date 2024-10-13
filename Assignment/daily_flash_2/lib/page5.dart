import 'package:flutter/material.dart';


class Scaffold5 extends StatefulWidget {
  const Scaffold5({super.key});

  @override
  State<Scaffold5> createState() => _Scaffold5State();
}

class _Scaffold5State extends State<Scaffold5> {

  String str = "Click Me";
  bool flag1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black54,
    body: Center(
      child: GestureDetector(
        onTap: (){
          if(flag1 = true){
            flag1 = false;
            str = "Container Pressed";
          }else{
            flag1 = true;
            str = "Click Me";
          }
          setState(() {});
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: (flag1)?  Colors.yellow: const Color.fromARGB(255, 226, 151, 38),
            border: Border.all(color: const Color.fromARGB(255, 215, 37, 64),width: 5),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: Center(
            child: Text(str,style: const TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black
            ),),
          ),
        ),
      ),
    ),
  );
  }
}
