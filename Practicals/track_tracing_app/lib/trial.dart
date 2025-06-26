

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Coursepage extends StatefulWidget {
  const Coursepage({super.key});

  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  TextEditingController searchController = TextEditingController();

  List<String> semesters = [
    'Sem 1',
    'Sem 2',
    'Sem 3',
    'Sem 4',
    'Sem 5',
    'Sem 6',
  ];
  String? selectedSem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Online Learning Flatform",
                  style: GoogleFonts.jost(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(32, 34, 68, 1),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(22, 127, 113, 1),
                      )),
                  child: const Center(
                    child: Icon(Icons.notifications,
                        color: Color.fromRGBO(22, 127, 113, 1), size: 26),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(34),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: const Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    style: GoogleFonts.jost(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 1),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(9, 97, 245, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            size: 25,
                          ),
                        ),
                        hintText: " Search Course",
                        hintStyle: GoogleFonts.mulish(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.025,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0.025),
                            borderRadius: BorderRadius.circular(12)),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: GoogleFonts.jost(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(9, 97, 245, 1),
                      ),
                    ),
                    DropdownButton(
                        underline: const SizedBox(),
                        value: selectedSem,
                        hint: const Text("Select sem"),
                        items: semesters.map((String sem) {
                          return DropdownMenuItem<String>(
                            value: sem,
                            child: Text(sem),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSem = newValue;
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 70,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16))),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: 251,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.person_2_sharp),
                                        Expanded(
                                          child: Text(
                                            " Faculty name",
                                            style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                color: const Color.fromRGBO(
                                                    255, 107, 0, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Course name",
                                            style: GoogleFonts.jost(
                                                fontSize: 18,
                                                color: const Color.fromRGBO(
                                                    32, 34, 68, 1),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  22, 127, 113, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            "5",
                                            style: GoogleFonts.mulish(
                                                fontSize: 16,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    LinearProgressIndicator(
                                     // semanticsLabel: "hello",
                                     // semanticsValue: "30",
                                      value: 0.1,
                                      color: const Color.fromRGBO(9, 97, 245, 1),
                                      // backgroundColor: Colors.amber,
                                      minHeight: 25,
                                      borderRadius: BorderRadius.circular(5),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Column(
          //         children: [Icon(Icons.home), Text("Courses")],
          //       ),
          //       Column(
          //         children: [Icon(Icons.home), Text("Courses")],
          //       ),
          //       Column(
          //         children: [Icon(Icons.home), Text("Courses")],
          //       ),
          //       Column(
          //         children: [Icon(Icons.home), Text("Courses")],
          //       ),
          //     ],
          //   ),
          // ),
        ));
  }
}