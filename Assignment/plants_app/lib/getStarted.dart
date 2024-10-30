import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State createState() => _GetStarted();
}

class _GetStarted extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(123, 123, 123, 1),
        toolbarHeight: 40,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width,
              child:
                  Image.asset("assets/GetStartedPlant.png", fit: BoxFit.fill)),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 34,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(47, 47, 47, 1),
              ),
              children: [
                const TextSpan(text: "Enjoy your \nlife with "),
                TextSpan(
                  text: "Plants",
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width-50,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(124, 180, 70, 1),
                Color.fromRGBO(62, 102, 24, 1) , 
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  ),
                  const SizedBox(width: 10,),
                  const Icon(Icons.arrow_forward_ios_rounded,color: Color.fromRGBO(255, 255, 255, 1),size: 22,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
