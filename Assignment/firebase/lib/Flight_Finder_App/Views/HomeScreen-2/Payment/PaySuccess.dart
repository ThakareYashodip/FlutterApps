import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/Payment/TransactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FlightPaymentSuccess extends StatefulWidget {
  const FlightPaymentSuccess({super.key});

  @override
  State<FlightPaymentSuccess> createState() => _FlightPaymentSuccessState();
}

class _FlightPaymentSuccessState extends State<FlightPaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Utilities.screenHeight * 0.3,
                ),
                SvgPicture.asset(
                  "assets/Recipes/PaymentSuccess.svg",
                  alignment: Alignment.center,
                  height: Utilities.screenHeight * 0.2,
                  width: Utilities.screenWidth * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: Utilities.screenHeight * 0.05,
                ),
                const ResponsiveText(
                  text: "Order Confirmed",
                  fontSize: 24,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: Utilities.screenHeight * 0.02,
                ),
                const ResponsiveText(
                  text: "Thank you for your order.",
                  fontSize: 16,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                const ResponsiveText(
                  text: "You will receive email confirmation shortly.",
                  fontSize: 16,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: Utilities.screenHeight * 0.025,
                ),
                GestureDetector(
                  onTap: () => Get.to(
                    () => const TransactionDetails(),
                  ),
                  child: Container(
                    height: Utilities.screenHeight * 0.125 / 2,
                    width: Utilities.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const ResponsiveText(
                        text: "See Details",
                        fontSize: 16,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
