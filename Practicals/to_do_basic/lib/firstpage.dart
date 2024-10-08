import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Basic_To_do extends StatefulWidget {
  const Basic_To_do({super.key});

  @override
  State<Basic_To_do> createState() => __Basic_To_doState();
}

class __Basic_To_doState extends State<Basic_To_do> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do list",
          style: GoogleFonts.lato(
              fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: ListView.builder(
        itemCount: 30,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            height: 112,
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorChange(index),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16),
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(199, 199, 199, 1),
                      ),
                      child: SvgPicture.asset("assets/svg/blank_Image.svg"),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            "Lorem Ipsum is simply setting industry.",
                            style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            "Simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's\nstandard dummy text ever since the 1500s",
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(84, 84, 84, 1),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "09/10/2024",
                        style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(132, 132, 132, 1),),
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/svg/Edit_icon.svg",height: 13,width: 13,),
                      const SizedBox(width: 10,),
                      SvgPicture.asset("assets/svg/Delete_icon.svg",height: 13,width: 13,),
                     ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color? colorChange(int index) {
  if(index % 4 == 0){
    return const Color.fromRGBO(250, 232, 232, 1);
  }else if(index % 4 == 1){
    return const Color.fromRGBO(232, 237, 250, 1);
  }else if(index % 4 == 2){
    return const Color.fromRGBO(250, 249, 232, 1);
  }else{
    return const Color.fromRGBO(250, 232, 250, 1);
  }
  }
}