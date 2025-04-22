import 'dart:developer';

import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utilities.screenHeight * 0.05,
              ),
              // Navigate to back
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
              // Transaction Details
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ResponsiveText(
                      text: "Transaction Details",
                      fontSize: 24,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: Utilities.screenHeight * 0.04,
                    ),
                    // Flight Ticket Info
                    const ShortTicket(),
                    const SizedBox(
                      height: 5,
                    ),
                    // Flight Ticket Info
                    const OrderStatistics(),
                    //Total Person
                    const TotalTransaction(),
                    const SizedBox(
                      height: 20,
                    ),
                    //Refund or Reschedule Ticket
                    Container(
                      height: Utilities.screenHeight * 0.05,
                      width: Utilities.screenWidth,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(252, 233, 233, 1),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ResponsiveText(
                            text: "Refund or Reschedule Ticket",
                            fontSize: 14,
                            fontColor: Color.fromRGBO(224, 30, 30, 1),
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Utilities.screenHeight * 0.05,
                    ),
                    Container(
                      height: Utilities.screenHeight * 0.05,
                      width: Utilities.screenWidth,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 100, 210, 1),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: const ResponsiveText(
                        text: "Enter",
                        fontSize: 16,
                        fontColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TotalTransaction extends StatelessWidget {
  const TotalTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Utilities.screenHeight * 0.1,
      width: Utilities.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Matt Murdock",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "Rp. 210.000",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Total",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "Rp. 210.000",
                fontSize: 12,
                fontColor: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderStatistics extends StatelessWidget {
  const OrderStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utilities.screenHeight * 0.2,
      width: Utilities.screenWidth,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Status",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "Success",
                fontSize: 12,
                fontColor: Color.fromRGBO(0, 100, 210, 1),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Invoice",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "INV23124131332",
                fontSize: 12,
                fontColor: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //3rd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Transaction Date",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "Wed, 18 Oct 2022 ",
                fontSize: 12,
                fontColor: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //4th Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                text: "Payment Method",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.7),
                fontWeight: FontWeight.w500,
              ),
              ResponsiveText(
                text: "Paytren",
                fontSize: 12,
                fontColor: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShortTicket extends StatelessWidget {
  const ShortTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Utilities.screenHeight * 0.2,
      width: Utilities.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1st Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Airline Name
              Row(
                children: [
                  Icon(Icons.rectangle),
                  ResponsiveText(
                    text: "Southwest Airlines",
                    fontSize: 14,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              // Executive
              ResponsiveText(
                text: "Executive",
                fontSize: 12,
                fontColor: Color.fromRGBO(37, 40, 49, 0.5),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //2nd Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Boarding Location
              Column(
                children: [
                  ResponsiveText(
                    text: "GTH",
                    fontSize: 24,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  // Takeoff time
                  ResponsiveText(
                    text: "14:00",
                    fontSize: 12,
                    fontColor: Color.fromRGBO(37, 40, 49, 0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              // Flight Logo
              Icon(
                Icons.airplanemode_active_rounded,
                color: Color.fromRGBO(0, 100, 210, 1),
              ),
              // Destination Location
              Column(
                children: [
                  ResponsiveText(
                    text: "KHQ",
                    fontSize: 24,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  // Takeoff time
                  ResponsiveText(
                    text: "07:15",
                    fontSize: 12,
                    fontColor: Color.fromRGBO(37, 40, 49, 0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          //3rd Travellers luggage and person count
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_2_rounded,
                    size: 10,
                    color: Color.fromRGBO(0, 100, 210, 1),
                  ),
                  ResponsiveText(
                    text: "2 Person",
                    fontSize: 12,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  Icon(
                    Icons.electric_bolt_outlined,
                    size: 10,
                    color: Color.fromRGBO(0, 100, 210, 1),
                  ),
                  ResponsiveText(
                    text: "Premium",
                    fontSize: 12,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              ResponsiveText(
                text: "IDR 350.000/Pax",
                fontSize: 12,
                fontColor: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          //4th Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Airline Name
              const Row(
                children: [
                  Icon(
                    Icons.circle,
                  ),
                  ResponsiveText(
                    text: "Matt Murdock",
                    fontSize: 14,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              // Executive
              GestureDetector(
                onTap: () {
                  log("Edit Pressed");
                },
                child: const ResponsiveText(
                  text: "Edit",
                  fontSize: 12,
                  fontColor: Color.fromRGBO(0, 100, 210, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
