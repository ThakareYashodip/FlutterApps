import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection("StudentInfo").get();
      setState(() {
        data = response.docs;
      });
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text(
          "Student Data",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: data.isEmpty
          ? Center(
              child: SpinKitSpinningLines(
                size: 50,
                color: Colors.white,
                duration: Duration(milliseconds: 1000),
              ),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final student = data[index];
                final courses =
                    student['courses'] as Map<String, dynamic>? ?? {};

                return GestureDetector(
                  onTap: () async {
                    try {
                      String documentId = data[index].id;
                      await FirebaseFirestore.instance
                          .collection("StudentInfo")
                          .doc(documentId)
                          .delete();
                      log("Deleted document with ID: $documentId");
                    } catch (e) {
                      log("Error deleting document: $e");
                    }
                    setState(() {
                      fetchData();
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${student['studentName']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "College: ${student['collegeName']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Courses:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ...courses.entries.map(
                          (entry) => Text(
                            "           ${entry.key} : ${entry.value}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
