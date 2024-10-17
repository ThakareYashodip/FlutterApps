import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_basic/ToDoModel.dart';

class Basic_To_do extends StatefulWidget {
  const Basic_To_do({super.key});

  @override
  State<Basic_To_do> createState() => __Basic_To_doState();
}

// ignore: camel_case_types
class __Basic_To_doState extends State<Basic_To_do> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
        itemCount: todoCards.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
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
                      clipBehavior: Clip.antiAlias,
                      child: Image.network('https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',fit: BoxFit.cover,),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todoCards[index].title,
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              todoCards[index].description,
                              style: GoogleFonts.lato(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(84, 84, 84, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        todoCards[index].date,
                        style: GoogleFonts.lato(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(132, 132, 132, 1),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){

                          titleController.text = todoCards[index].title;
                          descriptionController.text =  todoCards[index].description;
                          dateController.text = todoCards[index].date;

                          bottomSheet(true,todoCards[index]); //object return from specific index
                          setState(() {});
                        },
                        child: Icon(Icons.edit,size: 15,color: Colors.black,)
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          todoCards.remove(todoCards[index]);
                          setState(() {});
                        },
                        child: Icon(Icons.delete_outline,size: 15,color: Colors.black,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  void bottomSheet(bool flag,[Todomodel? todoModel]) {
    showModalBottomSheet(
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.bounceInOut,
        reverseDuration: const Duration(milliseconds: 1500),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "To-Do List",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Title",
                style: GoogleFonts.quicksand(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Lorem Ipsum typeseting industry. ",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                ),
              ),
              //2nd
              const SizedBox(height: 10),
              Text(
                "Description",
                style: GoogleFonts.quicksand(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText:
                      "Simply dummy text of the printing and  has been the typesetting Lorem Ipsum has been the industry.",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                ),
              ),
              //3rd
              const SizedBox(height: 10),
              Text(
                "Date",
                style: GoogleFonts.quicksand(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              TextField(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2025),
                  );
                  String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                  dateController.text = formattedDate;
                  setState(() {});
                },
                controller: dateController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                  ),
                  hintText: "2023-07-26",
                  hintStyle: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      )),
                ),
              ),
              //4th
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(flag == false){
                        submit(false);
                      }else{
                        submit(true,todoModel);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
    
    setState(() {});
  }

  

  Color? colorChange(int index) {
    if (index % 4 == 0) {
      return const Color.fromRGBO(250, 232, 232, 1);
    } else if (index % 4 == 1) {
      return const Color.fromRGBO(232, 237, 250, 1);
    } else if (index % 4 == 2) {
      return const Color.fromRGBO(250, 249, 232, 1);
    } else {
      return const Color.fromRGBO(250, 232, 250, 1);
    }
  } 

  void submit(bool flag,[Todomodel? todoObj]) {
    
    if(titleController.text.trim().isNotEmpty && descriptionController.text.trim().isNotEmpty && dateController.text.trim().isNotEmpty){
      if(flag == false){
        todoCards.add(
          Todomodel(title: titleController.text, description: descriptionController.text, date: dateController.text)
        );
      }
      else{
        todoObj!.title = titleController.text; 
        todoObj.description= descriptionController.text; 
        todoObj.date = dateController.text; 
      }
    }

    textClear();
    Navigator.of(context).pop();
    setState(() {
    });
  }

  void textClear() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  List todoCards = [];
}
