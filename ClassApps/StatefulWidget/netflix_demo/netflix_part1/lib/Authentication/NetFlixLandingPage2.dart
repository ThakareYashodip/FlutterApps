import 'package:flutter/material.dart';

Scaffold NetFlixLandingPage2() {
  return Scaffold(
    body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/flagged/photo-1590183030142-efad5a97612f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bmV0ZmxpeHxlbnwwfDF8MHx8fDA%3D"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 520,
          ),
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
    ),
  );
}
