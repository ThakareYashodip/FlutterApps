import 'package:flutter/material.dart';

void main() {
  runApp(const StaticListView());
}

class StaticListView extends StatelessWidget {
  const StaticListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Static ListView' , style : TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white
          )),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
              width: 411,
              child: Center(
                child: Text("Top 5 Places of Las Vegas" , style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold , color: Colors.black
                ),),
              ),
            ),
            Image.network(
              'https://media1.thrillophilia.com/filestore/rtujf3hxw1hvn0mlf4hr3hwo0k3e_1619072613_shutterstock_136183469.jpg?w=753&h=450&dpr=2.0',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite,
                color: Colors.red, size: 25,),
                Icon(Icons.comment,color: Colors.black, size: 25,),
                Icon(Icons.share,color: Colors.blue, size: 25,),
                SizedBox(width: 310,child: Center(
                  child: Text("Stratosphere tower",
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                )),
                Icon(Icons.bookmark, color: Colors.grey,size : 25)
              ],
            ),
            Image.network(
              'https://media1.thrillophilia.com/filestore/l7272k8107rwkjjzf308mpw5paj3_1619071579_shutterstock_201350363.jpg?w=753&h=450&dpr=2.0',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite,
                color: Colors.red, size: 25,),
                Icon(Icons.comment,color: Colors.black, size: 25,),
                Icon(Icons.share,color: Colors.blue, size: 25,),
                SizedBox(width: 310,child: Center(
                  child: Text("Paris Hotel",
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                ),),
                Icon(Icons.bookmark, color: Colors.grey,size : 25)
              ],
            ),
            Image.network(
              'https://media1.thrillophilia.com/filestore/yd2ykecp0lxk9zizb7iq5uc0o4w7_1619071891_shutterstock_136542707.jpg?w=753&h=450&dpr=2.0',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite,
                color: Colors.red, size: 25,),
                Icon(Icons.comment,color: Colors.black, size: 25,),
                Icon(Icons.share,color: Colors.blue, size: 25,),
                SizedBox(width: 310,child: Center(
                  child: Text(" Bellagio Resort",
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                ),),
                Icon(Icons.bookmark, color: Colors.grey,size : 25)
              ],
            ),
            Image.network(
              'https://media1.thrillophilia.com/filestore/8ffufgork1hrzb8wa8xcuirvo4z2_1619073378_shutterstock_761848381.jpg?w=753&h=450&dpr=2.0',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite,
                color: Colors.red, size: 25,),
                Icon(Icons.comment,color: Colors.black, size: 25,),
                Icon(Icons.share,color: Colors.blue, size: 25,),
                SizedBox(width: 310,child: Center(
                  child: Text("Hoover Dam", 
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                )),
                Icon(Icons.bookmark, color: Colors.grey,size : 25)
              ],
            ),
            Image.network(
              'https://media1.thrillophilia.com/filestore/9fpom5nt56o81ylz42beqm4s61vu_Colorado%20River,%20Las%20Vegas%20image%201.jpg?w=753&h=450&dpr=2.0',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite,
                color: Colors.red, size: 25,),
                Icon(Icons.comment,color: Colors.black, size: 25,),
                Icon(Icons.share,color: Colors.blue, size: 25,),
                SizedBox(width: 310,child: Center(
                  child: Text("Colorado River", 
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                )),
                Icon(Icons.bookmark, color: Colors.grey,size : 25)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
