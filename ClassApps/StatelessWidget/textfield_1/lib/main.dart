import "package:flutter/material.dart";

void main() {
  runApp(const DemoTextField());
}

class DemoTextField extends StatefulWidget {
  const DemoTextField({super.key});

  @override
  State createState() => _DemoTextField();
}

class _DemoTextField extends State {

  TextEditingController nameController = TextEditingController();
  String? myName ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TextField",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
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
                controller: nameController ,
                style: const TextStyle(
                  fontWeight: FontWeight.bold , fontSize: 25 , color: Colors.black
                ),
                obscureText: false, //for encryption 
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  hintText: "Enter your name : ",
                  hintStyle: TextStyle(
                    fontSize: 20.0, color: Colors.grey , fontWeight:  FontWeight.w600,
                  ),
                  border: OutlineInputBorder(
                  
                  ),
                ),
                onChanged: (String val) => "Value : $val",
                onEditingComplete: () => "Editing Complete",
                onSubmitted: (value) => "Value Submitted $value",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print("Add Data");
                myName = nameController.text;
                print("My Name : $myName");
                nameController.clear();
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text("ADD DATA" , 
                style: TextStyle(
                  fontSize: 25 , color: Colors.white
                ) ,
                ),
              ),
            ),
            const SizedBox( height: 40,),
            Text("My Name : $myName",
            style: const TextStyle(
              fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.indigo
            ),),
          ],
        ),
      ),
    );
  }
}
