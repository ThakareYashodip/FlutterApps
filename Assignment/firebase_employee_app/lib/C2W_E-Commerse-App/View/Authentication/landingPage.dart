import 'dart:developer';

import 'package:firebase_employee_app/C2W_E-Commerse-App/View/Essentials.dart';
import 'package:firebase_employee_app/C2W_E-Commerse-App/View/detailsPage_custom.dart';
import 'package:flutter/material.dart';

class ECommerseLandingPage extends StatefulWidget {
  const ECommerseLandingPage({super.key});

  @override
  State<ECommerseLandingPage> createState() => _ECommerseLandingPageState();
}

class _ECommerseLandingPageState extends State<ECommerseLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Essentials().getHeight(context) * 0.55,
              width: Essentials().getWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/AUSTIN989.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Essentials().textCustom(
                    message: "Find The\nBest Collections",
                    fontType: "Imprima",
                    size: 42,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                  Essentials().textCustom(
                    message:
                        "Get your dream item easily with FashionHub and get other intersting offer",
                    fontType: "Imprima",
                    size: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(121, 119, 128, 1),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //Sign Up Logic Pending
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Center(
                      child: Essentials().textCustom(
                          message: "Sign Up",
                          fontType: "Imprima",
                          size: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  //Sign In Logic Pending
                  onTap: () {
                    log("Sign In Pressed....");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return DetailsPageE_Commerse();
                      }),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 122, 0, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Essentials().textCustom(
                          message: "Sign In",
                          fontType: "Imprima",
                          size: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
