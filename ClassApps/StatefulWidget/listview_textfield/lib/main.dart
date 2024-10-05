

import 'package:flutter/material.dart';

void main() {
  runApp(const ListPlayer());
}
class ListPlayer extends StatefulWidget {
  const ListPlayer({super.key});

  @override
  State<ListPlayer> createState() => _ListPlayerState();
}

class _ListPlayerState extends State<ListPlayer> {

  TextEditingController NameController = TextEditingController();
  String? myName;
  List PlayerList = [];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Player',style: TextStyle(
            fontSize: 30, color: Colors.white , fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: NameController ,
                style: const TextStyle(
                  fontSize: 30
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Player Name ",
                  hintStyle: const TextStyle(
                    fontSize: 25 , color: Colors.grey
                  ),
                  border: OutlineInputBorder()
                ),

                onChanged: (String val) => "Value : $val",
                onEditingComplete: () => "Editing Completed",
                onSubmitted: (String val) => "Value Submitted : $val",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                print("ADD DATA");

                myName = NameController.text.trim();
                print("My Name : $myName");
                if(myName != ""){
                  PlayerList.add(myName!);
                  print("PlayerList length : ${PlayerList.length}");
                  NameController.clear();
                  setState(() {});
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: const Text("ADD DATA" , style: TextStyle(
                  fontSize: 25 , color: Colors.white 
                ),),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: PlayerList.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context , int index) {
                return Text(
                  "Name : ${PlayerList[index]}",
                  style: const TextStyle(fontSize: 25),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}