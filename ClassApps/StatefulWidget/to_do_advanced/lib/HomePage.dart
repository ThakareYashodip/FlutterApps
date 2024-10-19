// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_advanced/ToDoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todoCards = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 77, 235),
      // const Color.fromRGBO(111, 81, 255, 1),
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      //LISTVIEW BUILDER
                      child: ListView.builder(
                          itemCount: todoCards.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
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
                                      GestureDetector(
                                        onTap: () {
                                          titleController.text = todoCards[index].title;
                                          descriptionController.text = todoCards[index].description;
                                          dateController.text = todoCards[index].date;
                                          bottomSheet(true,todoCards[index]);
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromRGBO(89, 57, 241, 1),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      //DELETE BUTTON
                                      GestureDetector(
                                        onTap: () {
                                          todoCards.removeAt(index);
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromRGBO(89, 57, 241, 1),
                                          ),
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.white,
                                          ),
                                        ),
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
                                        blurRadius: 8,
                                        offset: Offset(0, -4), // x,y
                                        blurStyle: BlurStyle.outer),
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
                                              todoCards[index].title,
                                              style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            //Description
                                            Text(
                                              todoCards[index].description,
                                              style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            //DATE
                                            Text(
                                              todoCards[index].date,
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
        onPressed: () {
          bottomSheet(false);
          setState(() {});
        },
        backgroundColor: const Color.fromARGB(255, 42, 77, 235),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }

  void submit(bool flag, [ToDoModel? todoObj]) {
    if (flag == false) {
      if (titleController.text.trim().isNotEmpty &&
          descriptionController.text.trim().isNotEmpty &&
          dateController.text.trim().isNotEmpty) {
        todoCards.add(ToDoModel(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text));
      }
    }else{
      todoObj!.title = titleController.text;
      todoObj.description = descriptionController.text;
      todoObj.date = dateController.text;
    }
    clearData();
    Navigator.of(context).pop();
    setState(() {});
  }

  void clearData() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void bottomSheet(bool flag,[ToDoModel? todoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Create To-Do ",
                    style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                //TITLE
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Title",
                  style: GoogleFonts.quicksand(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Lorem Ipsum typeseting industry. ",
                    hintStyle: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                //DESCRIPTION
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Description",
                  style: GoogleFonts.quicksand(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText:
                        "Simply dummy text of the printing and  has been the typesetting Lorem Ipsum has been the industry.",
                    hintStyle: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                //DATE
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Date",
                  style: GoogleFonts.quicksand(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    String formattedDate =
                        DateFormat.yMMMd().format(pickedDate!);
                    dateController.text = formattedDate;
                  },
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: "29 October 2024",
                    hintStyle: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(89, 57, 241, 1), width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_month_outlined,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    (flag == false)? submit(flag): submit(flag,todoObj);
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(89, 57, 241, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
