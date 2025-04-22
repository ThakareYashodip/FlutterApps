import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:firebase_employee_app/Travenor/View/landing_page_custom.dart';
import 'package:flutter/material.dart';

class SplashScreenTravenor extends StatefulWidget {
  const SplashScreenTravenor({super.key});

  @override
  State<SplashScreenTravenor> createState() => _SplashScreenTravenorState();
}

class _SplashScreenTravenorState extends State<SplashScreenTravenor> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return LandingPageCustom();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 110, 253, 1),
      body: Center(
        child: EssentialsCustom().custom_Text(
            msg: "Travenor",
            size: 34,
            color: Colors.white,
            fontweight: FontWeight.w400,
            fontFamily: "Aclonica"
            ),
      ),
    );
  }
}
