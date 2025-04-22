import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_employee_app/InheritedWidgetLearning/View/LastPageWidgetIheritedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginDetailsInheritedWidget extends StatefulWidget {
  const LoginDetailsInheritedWidget({super.key});

  @override
  State<LoginDetailsInheritedWidget> createState() =>
      _LoginDetailsInheritedWidgetState();
}

class _LoginDetailsInheritedWidgetState
    extends State<LoginDetailsInheritedWidget> {
  List data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection("InheritedWidgetLearning")
        .get();

    setState(() {
      data = response.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data.isEmpty)
          ? Center(
              child: SpinKitChasingDots(
                color: Colors.black,
                size: 50,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "User Credentials Details...",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final details = data[index];
                        return Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "(${index + 1})",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  Text(
                                    "Email : ${details["email"]}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Text(
                                    "Password : ${details["password"]}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const LastPageWidgetIheritedWidget();
              },
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.arrow_forward,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
