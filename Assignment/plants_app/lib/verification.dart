import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(123, 123, 123, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_outlined)),
              const Spacer(),
              Image.asset("assets/LoginPage.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the OTP code from the phone we just sent you.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //1st
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 20,
                              color: Color.fromRGBO(0, 0, 0, 0.06),
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            )),
                      ),
                    ),
                    //2nd
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 20,
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            blurStyle: BlurStyle.outer),
                      ]),
                      child: const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            )),
                      ),
                    ),
                    //3rd
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 20,
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            blurStyle: BlurStyle.outer),
                      ]),
                      child: const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            )),
                      ),
                    ),
                    //4th
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 20,
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            blurStyle: BlurStyle.outer),
                      ]),
                      child: const TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(204, 211, 196, 1),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Don’t receive OTP code! ",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                  "Submit",
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
