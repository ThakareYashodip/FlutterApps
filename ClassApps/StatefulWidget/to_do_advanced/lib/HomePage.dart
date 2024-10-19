// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //USER INFO
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  "Spidey",
                  style: GoogleFonts.quicksand(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          //Container1st
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromRGBO(217, 217, 217, 1)),
              child: Column(
                children: [
                  //CREATE TODO LIST TEXT
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  //2nd Container
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      //LISTVIEW BUILDER
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            //Slidable for EDIT & DELETE
                            return Slidable(
                              //endActionPane
                              endActionPane:
                                  ActionPane(motion: BehindMotion(), children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      //EDIT BUTTON
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(89, 57, 241, 1),
                                        ),
                                        child: Icon(Icons.edit,color: Colors.white,),
                                      ),
                                      //DELETE BUTTON
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(89, 57, 241, 1),
                                        ),
                                        child: Icon(Icons.delete_outline,color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                              //CARDS
                              child: Container(
                                margin: const EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      blurRadius: 10,
                                      offset: Offset(0, -4), // x,y
                                      blurStyle: BlurStyle.outer
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    //IMAGE
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        "assets/Group42.png",
                                        height: 20,
                                        width: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Title
                                            Text(
                                              "Lorem Ipsum is simply dummy industry.",
                                              style: GoogleFonts.inter(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            //Description
                                            Text(
                                              "Simply dummy text of the printing and type setting industry. Lorem Ipsum Lorem Ipsum Lorem.",
                                              style: GoogleFonts.inter(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            //DATE
                                            Text(
                                              "10 July 2023",
                                              style: GoogleFonts.inter(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bottomSheet();
          setState(() {});
        },
        backgroundColor: Color.fromRGBO(89, 57, 241, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add,size: 35,color:Colors.white,),
      ),
    );
  }

  void bottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Create To-Do ",
              style: GoogleFonts.quicksand(
                fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black
              ),
            ),
          ],
        );
      });
  }
}

