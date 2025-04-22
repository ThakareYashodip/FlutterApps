import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:firebase/Flight_Finder_App/Views/HomeScreen-2/Payment/PaySuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Flightdashboard extends StatefulWidget {
  const Flightdashboard({super.key});

  @override
  State<Flightdashboard> createState() => _FlightdashboardState();
}

class _FlightdashboardState extends State<Flightdashboard> {
  RadioGroupController myController = RadioGroupController();
  TextEditingController fromLocation = TextEditingController();
  TextEditingController toLocation = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController travellers = TextEditingController();

  DateTime dt = DateTime.now();
  // Future<void> _selectDate() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: Get.context!,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2025),
  //       lastDate: DateTime(2030),
  //       barrierColor: Colors.blue);
  //   if (pickedDate != null) {
  //     date.text = pickedDate.toString().split(" ")[0];
  //   }
  // }

  void _showModalBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Utilities.screenHeight * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: ResponsiveText(
                    text: "Select Date",
                    fontSize: 20,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: SfDateRangePicker(
                backgroundColor: Colors.white,
                selectionColor: Colors.blue,
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs args) =>
                        date.text = args.value.toString().split(" ")[0],
                // view: DateRangePickerView.year,
                selectionMode: DateRangePickerSelectionMode.single,
                showNavigationArrow: true,
                showTodayButton: true,
                todayHighlightColor: Colors.blueAccent,
                selectionTextStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                headerStyle: const DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const ResponsiveText(
                      text: "Confirm",
                      fontSize: 20,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: Utilities.screenHeight * 0.02,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 210, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Utilities.screenHeight,
          width: Utilities.screenWidth,
          child: Stack(
            children: [
              const FirstHalf(),
              Positioned(
                top: Utilities.screenHeight * 0.30,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: Utilities.screenHeight * 0.75,
                  width: Utilities.screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Utilities.screenWidth * 0.10),
                      topRight: Radius.circular(Utilities.screenWidth * 0.10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: Utilities.screenHeight * 0.01),
                      RadioGroup(
                        controller: myController,
                        values: const ["One-Way", "Round-Trip"],
                        indexOfDefault: 0,
                        orientation: RadioGroupOrientation.horizontal,
                        decoration: RadioGroupDecoration(
                          spacing: Utilities.screenWidth * 0.15,
                          labelStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          activeColor: const Color.fromRGBO(0, 100, 210, 1),
                        ),
                      ),
                      SizedBox(height: Utilities.screenHeight * 0.025),
                      const ResponsiveText(
                        text: "From",
                        fontSize: 14,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      TextField(
                        controller: fromLocation,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Utilities.screenWidth * 0.04),
                        decoration: InputDecoration(
                          hintText: "From",
                          filled: true,
                          fillColor: const Color.fromRGBO(230, 232, 233, 1),
                          prefixIcon: const Icon(
                            Icons.flight_takeoff_rounded,
                            color: Color.fromRGBO(0, 100, 210, 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                          ),
                        ),
                      ),
                      SizedBox(height: Utilities.screenHeight * 0.025),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResponsiveText(
                            text: "To",
                            fontSize: 14,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          // Add Toggle Button Here
                        ],
                      ),
                      TextField(
                        controller: toLocation,
                        decoration: InputDecoration(
                          hintText: "To",
                          filled: true,
                          fillColor: const Color.fromRGBO(230, 232, 233, 1),
                          prefixIcon: const Icon(
                            Icons.flight_land_rounded,
                            color: Color.fromRGBO(0, 100, 210, 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                          ),
                        ),
                      ),
                      SizedBox(height: Utilities.screenHeight * 0.025),
                      const ResponsiveText(
                        text: "Departure Time",
                        fontSize: 14,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      TextField(
                        controller: date,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: (date.text == "")
                              ? dt.toString().split(" ")[0]
                              : date.text,
                          fillColor: const Color.fromRGBO(230, 232, 233, 1),
                          prefixIcon: const Icon(
                            Icons.calendar_month,
                            color: Color.fromRGBO(0, 100, 210, 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                          ),
                        ),
                        onTap: _showModalBottomSheet,
                        readOnly: true,
                      ),
                      SizedBox(height: Utilities.screenHeight * 0.025),
                      const ResponsiveText(
                        text: "Travellers",
                        fontSize: 14,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      TextField(
                        controller: travellers,
                        decoration: InputDecoration(
                          hintText: "Travellers",
                          filled: true,
                          fillColor: const Color.fromRGBO(230, 232, 233, 1),
                          prefixIcon: const Icon(
                            Icons.person_2,
                            color: Color.fromRGBO(0, 100, 210, 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                          ),
                        ),
                      ),
                      SizedBox(height: Utilities.screenHeight * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const FlightPaymentSuccess());
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(double.maxFinite,
                                Utilities.screenHeight * 0.1 / 2),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(0, 100, 210, 1),
                          ),
                        ),
                        child: const ResponsiveText(
                          text: "Travellers",
                          fontSize: 16,
                          fontColor: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: Utilities.screenHeight * 0.4,
      width: Utilities.screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 100, 210, 1),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Utilities.screenHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: Utilities.screenWidth * 0.06,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: Utilities.screenWidth / 5),
              const ResponsiveText(
                text: "Search Flights",
                fontSize: 20,
                fontColor: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: Utilities.screenHeight * 0.025),
          const ResponsiveText(
            text: "   Discover",
            fontSize: 34,
            fontColor: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          const ResponsiveText(
            text: "   a new world...",
            fontSize: 34,
            fontColor: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
