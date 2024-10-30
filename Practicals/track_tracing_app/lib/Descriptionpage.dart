import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int? selectedNumber;

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 65, 159, 231),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget? viewContent() {
    if (selectedNumber == 0) {
      return Text(
        "Description",
        style: GoogleFonts.quicksand(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      );
    } else if (selectedNumber == 1) {
      return Text(
        "Content",
        style: GoogleFonts.quicksand(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      );
    } else if (selectedNumber == 2) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
        "Description",
        style: GoogleFonts.quicksand(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      ),
            ],
          );
        } ,
      );
    } else {
      return Text(
        "Rating",
        style: GoogleFonts.quicksand(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Description Content",
          style: GoogleFonts.quicksand(
              fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedNumber=0;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: boxDecoration(),
                      child: Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedNumber=1;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: boxDecoration(),
                      child: Text(
                        "Content",
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedNumber=2;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: boxDecoration(),
                      child: Text(
                        "Marks",
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedNumber=3;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: boxDecoration(),
                      child: Text(
                        "Rating",
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: viewContent() ?? const SizedBox.shrink(),),
          ],
        ),
      ),
    );
  }
}
