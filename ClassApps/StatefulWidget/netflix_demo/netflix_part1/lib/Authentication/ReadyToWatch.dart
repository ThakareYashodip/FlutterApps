import 'package:flutter/material.dart';

class ReadyTowatch extends StatefulWidget{
  const ReadyTowatch({super.key});

  @override
  State createState() => _ReadyToWatch();
}

class _ReadyToWatch extends State{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.close_sharp,size: 30 , color: Colors.black,),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ready to watch ? ',
              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600,fontFamily: "Montserrat"),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your email to create or sign in to\n                   your account. ',
              style: TextStyle(fontSize: 14, color: Colors.black54,fontFamily: "Montserrat"),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.black45,fontFamily: "Montserrat"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
               // Navigator.push(context , MaterialPageRoute(builder: (context) => const )),
              },
              child: Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: "Montserrat",fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}