import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage1 extends StatefulWidget {
  const LandingPage1({super.key});

  @override
  State<LandingPage1> createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {

  @override
  Widget build(BuildContext context) {
    print("${MediaQuery.of(context).size.width}");
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://img.freepik.com/free-photo/view-modern-photorealistic-lamp_23-2151038895.jpg?ga=GA1.1.915554636.1727464067&semt=ais_hybrid"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child:  Column(
          children: [
            const Spacer(),
            Padding(padding: 
            const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                const SizedBox(height: 30,),
                 Text("All services on \nyour fingertips.",style: GoogleFonts.montserrat(
                        fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("Log In",style: GoogleFonts.montserrat(
                            fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.brown[500],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("Sign Up",style: GoogleFonts.montserrat(
                            fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}