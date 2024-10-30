import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(102, 101, 101, 1),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/LoginPage.png"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Log in",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(204, 211, 196, 1), width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(204, 211, 196, 1),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(204, 211, 196, 1),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.call_outlined,
                  size: 20,
                  color: Color.fromRGBO(164, 164, 164, 1),
                ),
                hintText: "Mobile Number",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(164, 164, 164, 1),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 40,
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurStyle: BlurStyle.outer
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(124, 180, 70, 1),
                    Color.fromRGBO(62, 102, 24, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
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
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 22,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // const Spacer(),
          Image.asset("assets/LoginPage2.png"),
        ],
      ),
    );
  }
}
