import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_employee_app/IPL_Player_Info/View/PageRoute_custom.dart';
import 'package:firebase_employee_app/IPL_Player_Info/View/Teams_Info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Teamselection extends StatefulWidget {
  const Teamselection({super.key});

  @override
  State<Teamselection> createState() => _TeamselectionState();
}

class _TeamselectionState extends State<Teamselection> {
  Map<String, dynamic> data = {};
  bool isLoading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    // Set loading state to true
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch the document from Firestore
      DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
          .instance
          .collection("IPL_Teams")
          .doc("IPLBackground")
          .get();

      // Log key-value pairs from the fetched data
      response.data()?.forEach(
        (key, value) {
          log("KEY : $key\nVALUE : $value");
        },
      );

      // Update state with the fetched data
      setState(() {
        data = response.data() ?? {};
      });
    } catch (e) {
      // Handle errors
      log("Error fetching data: $e");
    } finally {
      // Set loading state to false after the operation is complete
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Convert the map to a list of entries
    final entries = data.entries.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  const Icon(
                    Icons.sports_cricket_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Cricket , ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Anytime , ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Anywhere !!!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Number Of Teams : ${data.length}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w800),
              ),
              ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: entries.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  final key = entry.key;
                  final value = entry.value;

                  return GestureDetector(
                    onDoubleTap: () {
                      log("$key");
                      Navigator.push(
                          context, createRoute(IplTeams(teamName: key)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            value,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            key, // Display the key as text
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
