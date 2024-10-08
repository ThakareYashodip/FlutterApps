import 'package:flutter/material.dart';
import 'package:netflix_part1/Authentication/userSelection.dart';


class NetFlixLandingPage2 extends StatefulWidget {
  const NetFlixLandingPage2({super.key});

  @override
  State<NetFlixLandingPage2> createState() => _NetFlixLandingPage2State();
}

class _NetFlixLandingPage2State extends State<NetFlixLandingPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/flagged/photo-1590183030142-efad5a97612f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bmV0ZmxpeHxlbnwwfDF8MHx8fDA%3D"),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before_rounded,size: 40, color: Colors.white,)),
          ),
          const Spacer(),
          Column(
            children: [
              const Text(
          "    Unlimited \nentertainment,\n one low price.",
          style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold , color: Colors.white , fontFamily: "Montserrat"
          ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
          "   All of Netflix, starting at just \n                         ₹149.",
          style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500 , color: Colors.white , fontFamily: "Montserrat"
          ),
                    ),
                    const SizedBox(
          height: 20,
          child: Text("o          o         o         o",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 10,),
                    Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                print("GET STARTED");
                Navigator.push(context, MaterialPageRoute(builder: (context) => userSelection()));
              },
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 196, 21, 8)
                ),
                width: 380,
                child: const Center(
                  child:  Text(
                    "GET STARTED",
                    style: TextStyle(
                      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold , fontFamily: "Montserrat"
                    ),
                  ),
                ),
              ),
            ),
          ],
                    )
            ],
          ),
        ],
      ),
    ),
  );
  }
}

