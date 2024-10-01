
import 'package:flutter/material.dart';

void main(){
  runApp(GradientStateless());
}
class GradientStateless extends StatelessWidget{
  const GradientStateless({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GradientColor(),
    );
  }
}

class GradientColor extends StatefulWidget{
  const GradientColor({super.key});

  @override
  State createState() => _GradientColor();
}
int x = 0 ;

List<Color> colorsChange(){
  switch(x){
    case 0 :
        return const [Colors.blue , Colors.red];
    case 1 : 
      return const [Colors.purple , Colors.white];
    case 2 : 
      return const [Colors.black , Colors.pink];
    case 3 : 
      return const [Color.fromARGB(255, 251, 241, 154) , Colors.red];
    case 4 : 
      return const [ Colors.purple , Colors.yellow ];
    default : 
      x = 0 ;
      return const [Color.fromARGB(255, 237, 21, 168) , Colors.lime];
  }
}

class _GradientColor extends State<GradientColor>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Color', style: TextStyle(
          fontWeight: FontWeight.bold , fontSize: 30 , color : Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue , Colors.red],
          ),
        ),
        child: Center(
          child:  Container(
            height: 300,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: colorsChange(),
              ),
            ),
            child: const Text("Gradient",style: TextStyle(
              fontSize: 30, color: Colors.white , fontWeight: FontWeight.bold
            )),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 30,),
          FloatingActionButton(
            onPressed: (){
              x++;
              setState(() {});
            },
            backgroundColor: Colors.blue,
            child: 
            const Icon(Icons.change_circle , size: 40, color: Colors.white,),
            ),
        ],
      ),
    );
  }
}

