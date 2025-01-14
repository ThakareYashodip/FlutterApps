import 'package:firebase_employee_app/IPL_Player_Info/View/HomePage.dart';
import 'package:firebase_employee_app/student_info/view/pageroute_custom.dart';
import 'package:flutter/material.dart';

class IplLandingPage extends StatefulWidget {
  const IplLandingPage({Key? key}) : super(key: key);

  @override
  _IplLandingPageState createState() => _IplLandingPageState();
}

class _IplLandingPageState extends State<IplLandingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, createRoute(Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 1,
              filterQuality: FilterQuality.high,
              image: AssetImage("assets/CricketBackground.jpg"),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Icon(
                  Icons.sports_cricket_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black12,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "All about ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "Cricket ,",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 255, 238, 56)),
                        ),
                      ],
                    ),
                    const Text(
                      "One App !",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255)),
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
