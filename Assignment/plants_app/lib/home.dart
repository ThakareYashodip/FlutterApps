import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(123, 123, 123, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Find your favorite plants",
                style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 16.1,
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        offset: Offset(0, 4),
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.shopping_bag_outlined,color: Color.fromRGBO(62, 102, 24, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          //Cards Horizontal
          SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(204, 231, 185, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30% OFF",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "0${++index}-23 April",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/SpiderPlant.png",
                      height: 110,
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //3 dots
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("  o "), Text("  o "), Text("  o ")],
          ),
          //Nested Listview
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Indoor",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) {
                          return Container(
                          width: 141,
                          height: 170,
                          margin: const EdgeInsets.only(top: 15, bottom: 15 , right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 16.1,
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                  offset: Offset(0, 4),
                                  blurStyle: BlurStyle.outer),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child:
                                        Image.asset("assets/PlantsContainer.png")),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Snake Plants",
                                  style: GoogleFonts.dmSans(
                                    color: const Color.fromRGBO(48, 48, 48, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹350",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(62, 102, 24, 1),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 26,
                                      width: 26,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(237, 238, 235, 1),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 16.1,
                                              color: Color.fromRGBO(237, 238, 235, 1),
                                              offset: Offset(0, 4),
                                              blurStyle: BlurStyle.outer),
                                        ],
                                      ),
                                      child: const Center(child: Icon(Icons.shopping_bag_outlined,color: Color.fromRGBO(0,0,0,1),size: 20,)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromRGBO(204, 211, 196, 1),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
