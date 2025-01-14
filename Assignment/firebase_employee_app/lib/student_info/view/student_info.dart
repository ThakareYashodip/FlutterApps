import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_employee_app/student_info/display_info.dart';
import 'package:firebase_employee_app/student_info/view/pageroute_custom.dart';
import 'package:flutter/material.dart';

class StudentsInfo extends StatefulWidget {
  const StudentsInfo({super.key});

  @override
  State<StudentsInfo> createState() => __StudentsInfoStateState();
}

class __StudentsInfoStateState extends State<StudentsInfo> {
  TextEditingController studNameController = TextEditingController();
  TextEditingController clgNameController = TextEditingController();
  TextEditingController coursesNameController = TextEditingController();

  Map coursesData = {};
  bool isOffline = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.library_books_outlined,
                  color: Colors.white,
                ),
                const Text(
                  'Students Info',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.library_books_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: studNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_4_outlined,
                    color: Colors.white,
                  ),
                  hintText: "Enter Your Name ...",
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: clgNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.apartment_outlined,
                    color: Colors.white,
                  ),
                  hintText: "Enter Your Collge Name ...",
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: coursesNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.subject_outlined,
                    color: Colors.white,
                  ),
                  hintText: "Enter Your Courses ...",
                  hintStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enrolled Courses: ${coursesData.length}\n${coursesData.entries.map((entry) => "${entry.key} : ${entry.value}").join(" , ")}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Selected Mode : ",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOffline = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            color: (isOffline) ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            "Offline",
                            style: TextStyle(
                              fontSize: 18,
                              color: isOffline ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          isOffline = false;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            color: isOffline ? Colors.white : Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            "Online",
                            style: TextStyle(
                              fontSize: 18,
                              color: isOffline ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (coursesNameController.text.isNotEmpty) {
                      String mode = "";
                      (isOffline) ? mode = "Offline" : mode = "Online";
                      coursesData[coursesNameController.text] = mode;
                      coursesNameController.clear();
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size(20, 40),
                    ),
                    elevation: WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    "Add Course",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (studNameController.text.isNotEmpty &&
                          clgNameController.text.isNotEmpty &&
                          coursesData.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "studentName": studNameController.text,
                          "collegeName": clgNameController.text,
                          "courses": coursesData
                        };

                        DocumentReference<Map<String, dynamic>> response =
                            await FirebaseFirestore.instance
                                .collection("StudentInfo")
                                .add(data);
                        studNameController.clear();
                        clgNameController.clear();
                        coursesData.clear();
                        setState(() {});
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(
                        Size(140, 40),
                      ),
                      elevation: WidgetStatePropertyAll(5),
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    child: const Text(
                      "Add Data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, createRoute(const GetData()));
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(
                        Size(140, 40),
                      ),
                      elevation: WidgetStatePropertyAll(5),
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    child: const Text(
                      "Get Data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
