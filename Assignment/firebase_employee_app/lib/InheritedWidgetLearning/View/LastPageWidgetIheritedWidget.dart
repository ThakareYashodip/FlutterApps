import 'package:firebase_employee_app/InheritedWidgetLearning/View/Services/InheritedWidgetRefresh_custom.dart';
import 'package:firebase_employee_app/InheritedWidgetLearning/View/LoginInhertedWidget_custom.dart';
import 'package:flutter/material.dart';

class LastPageWidgetIheritedWidget extends StatefulWidget {
  const LastPageWidgetIheritedWidget({super.key});

  @override
  State<LastPageWidgetIheritedWidget> createState() =>
      _LastPageWidgetIheritedWidgetState();
}

class _LastPageWidgetIheritedWidgetState
    extends State<LastPageWidgetIheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      InheritedWidgetRefreshcustom.of(context).email = "";
                      InheritedWidgetRefreshcustom.of(context).password = "";
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return const InheritedWidgetLogin();
                        }),
                      );
                    },
                    color: Colors.blue,
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      "Email : ${InheritedWidgetRefreshcustom.of(context).email}",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      "Password : ${InheritedWidgetRefreshcustom.of(context).password}",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
