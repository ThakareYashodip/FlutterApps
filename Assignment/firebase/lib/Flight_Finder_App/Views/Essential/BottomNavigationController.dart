import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/MyController.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/FlightDashBoard.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/Payment/PaySuccess.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/Payment/TransactionHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationView extends StatelessWidget {
  final List<Widget> pages = [
    const Flightdashboard(),
    const Transactionhome(),
    const FlightPaymentSuccess(),
  ];

  BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(), // Initialize BottomNavController here
      builder: (controller) {
        return Scaffold(
          body: Obx(() => pages[controller.currentIndex.value]),
          bottomNavigationBar: Obx(
            () => SalomonBottomBar(
              backgroundColor: Colors.white,
              margin:
                  EdgeInsets.symmetric(horizontal: Utilities.screenWidth * 0.1),
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.changeTab(index),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: const Color.fromRGBO(0, 100, 210, 1),
                  unselectedColor: Colors.grey,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.confirmation_number),
                  title: const Text("Transaction"),
                  selectedColor: const Color.fromRGBO(0, 100, 210, 1),
                  unselectedColor: Colors.grey,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text("Profile"),
                  selectedColor: const Color.fromRGBO(0, 100, 210, 1),
                  unselectedColor: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
