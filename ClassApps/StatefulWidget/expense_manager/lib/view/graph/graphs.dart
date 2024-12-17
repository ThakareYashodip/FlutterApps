import 'package:expense_manager/view/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGraph extends StatefulWidget {
  const MyGraph({super.key});

  @override
  State<MyGraph> createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Graph",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext scaffoldContext) {
            return IconButton(
              onPressed: () {
                Scaffold.of(scaffoldContext).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black),
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}