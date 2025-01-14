import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EmployeeInfo extends StatefulWidget {
  const EmployeeInfo({super.key});

  @override
  State<EmployeeInfo> createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  TextEditingController empNameController = TextEditingController();
  TextEditingController empSalController = TextEditingController();
  TextEditingController devTypeControlller = TextEditingController();
  List<Map<String, dynamic>> empdata = [];
  String empMaxSal = "";
  String devTypeMaxEmpl = "";
  double maxSal = 0;

  getData() async {
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection("EmployeeFirebaseDemo")
        .doc("Employee")
        .collection("EmployeeInfo")
        .get();
    log("Length : ${response.docs.length}");
    for (var value in response.docs) {
      log("Value : ${value.data()}");
      var data = double.parse(value.data()["EmpSal"]);
      if (data > maxSal) {
        maxSal = data;
        empMaxSal = value.data()["EmpName"];
        devTypeMaxEmpl = value.data()["DevType"];
      }
    }
    log("Maximum Salary : $maxSal \n Employee Name : $empMaxSal \n Developer Type : $devTypeMaxEmpl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Employee Info Firebase",
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: empNameController,
              decoration: InputDecoration(
                hintText: "Enter Employee Name",
                hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: empSalController,
              decoration: InputDecoration(
                hintText: "Enter Employee Salary",
                hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: devTypeControlller,
              decoration: InputDecoration(
                hintText: "Enter Employee Developer Type",
                hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Timestamp timestamp = Timestamp.now();
                Map<String, dynamic> data = {
                  "EmpName": empNameController.text,
                  "EmpSal": empSalController.text,
                  "DevType": devTypeControlller.text,
                  "TimeStamp": timestamp,
                };
                await FirebaseFirestore.instance
                    .collection("EmployeeFirebaseDemo")
                    .doc("Employee")
                    .collection("EmployeeInfo")
                    .add(data);
                log("Data Added...");
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 231, 102, 42),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(-3, -4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "ADD DATA",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                getData();
                setState(() {});
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(-3, -4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "GET DATA",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                color: Colors.orange[200],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Highest Salary   :   $maxSal",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Emp. Name : $empMaxSal",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Dev. Type     : $devTypeMaxEmpl",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
