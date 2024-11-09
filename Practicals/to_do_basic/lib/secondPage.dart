import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class assignment_to_do extends StatefulWidget {
  const assignment_to_do({super.key});

  @override
  State<assignment_to_do> createState() => _assignment_to_doState();
}

class _assignment_to_doState extends State<assignment_to_do> {

  TextEditingController nameController = TextEditingController();
  TextEditingController cmpNameController = TextEditingController();

  List<Map> infoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Info App",
          style: GoogleFonts.lato(
            fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.blue
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: GoogleFonts.lato(
              fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.blue
            ),
            hoverColor: Colors.lightGreen,
            border:  OutlineInputBorder(borderSide: const BorderSide(
              width: 2 , color: Colors.blue
            ),
            borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: cmpNameController,
              decoration: InputDecoration(
                hintText: "DreamCompany",
                hintStyle: GoogleFonts.lato(
              fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.blue
            ),
            hoverColor: Colors.lightGreen,
            border: OutlineInputBorder(borderSide: const BorderSide(
              width: 2 , color: Colors.blue
            ),
            borderRadius: BorderRadius.circular(20),),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
                // infoList.add({"name":nameController.text,"cName":cmpNameController.text});
                // nameController.clear();
                // cmpNameController.clear();
              setState(() {});
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Submit",style: GoogleFonts.lato(
                  fontSize: 30 ,  fontWeight: FontWeight.bold , color: Colors.white
                ),),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: infoList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index){
                return  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name : ${infoList[index]['name']}",style: GoogleFonts.lato(
                          fontSize: 16 ,  fontWeight: FontWeight.bold , color: Colors.blue
                        ),),
                        Text("DreamCompany : ${infoList[index]['cName']}",style: GoogleFonts.lato(
                          fontSize: 16 ,  fontWeight: FontWeight.bold , color: Colors.blue
                        ),),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}