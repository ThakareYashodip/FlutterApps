import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[400],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.home_outlined,color: Colors.blue,size: 35,)),
                      const SizedBox(width: 20),
                       Text("RightJoy",style: GoogleFonts.montserrat(
                        fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                  ],
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
}}