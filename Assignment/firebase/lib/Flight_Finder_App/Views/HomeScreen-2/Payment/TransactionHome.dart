import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/MyController.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/FlightDashBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Transactionhome extends StatelessWidget {
  const Transactionhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Utilities.screenHeight * 0.05,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Utilities.screenHeight * 0.05,
            ),
            SvgPicture.asset("assets/Recipes/Group11.svg"),
            SizedBox(
              height: Utilities.screenHeight * 0.05,
            ),
            const ResponsiveText(
              text: "Let’s go somewhere",
              fontSize: 20,
              fontColor: Color.fromRGBO(23, 24, 24, 1),
              fontWeight: FontWeight.w500,
            ),
            const ResponsiveText(
              text:
                  " After book a trip you can manage orders and see E-ticket here.",
              fontSize: 16,
              fontColor: Color.fromRGBO(80, 83, 83, 1),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Utilities.screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                final MyController controller = Get.find<MyController>();
                controller.changeTab(0);
              },
              child: Container(
                height: Utilities.screenHeight * 0.125 / 2,
                width: Utilities.screenWidth,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 100, 210, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const ResponsiveText(
                    text: "Book a trip",
                    fontSize: 16,
                    fontColor: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
