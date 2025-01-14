import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_employee_app/IPL_Player_Info/View/TeamSelection.dart';
import 'package:firebase_employee_app/IPL_Player_Info/View/Teams_Info.dart';
import 'package:firebase_employee_app/IPL_Player_Info/View/PageRoute_custom.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController plyNameController = TextEditingController();
  TextEditingController plyAgeController = TextEditingController();
  TextEditingController plyJerNoController = TextEditingController();
  String? plyTeamName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Icon(
                      Icons.sports_cricket_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Cricket , ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Anytime , ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Anywhere !!!",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();
                      final XFile? pickedFile = await imagePicker.pickImage(
                          source: ImageSource.gallery);

                      print(
                          "File Name : ${pickedFile!.name}\n File Path : ${pickedFile.path}");
                      setState(() {
                        selectedImage = File(pickedFile.path);
                      });
                    },
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: selectedImage == null
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.purple],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 50,
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                File(selectedImage!.path),
                                fit: BoxFit.cover,
                                isAntiAlias: true,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    TextFormField(
                      controller: plyNameController,
                      decoration: InputDecoration(
                        hintText: "Enter Player Name",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(199, 76, 72, 72),
                        ),
                        prefixIcon: const Icon(Icons.person_4_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: plyAgeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Player Age",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(199, 76, 72, 72),
                        ),
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        } else if (int.parse(value) < 18 ||
                            int.parse(value) > 50) {
                          return 'Age should be between 18 and 50';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: plyJerNoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Jersey No.",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(199, 76, 72, 72),
                        ),
                        prefixIcon: const Icon(Icons.sports_cricket_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Jersey No.';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: plyTeamName,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF6F8FF),
                        hintText: "Select Team",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(199, 76, 72, 72),
                        ),
                        prefixIcon: const Icon(Icons.groups_rounded),
                      ),
                      items: [
                        "Mumbai Indians",
                        "Chennai Super Kings",
                        "Royal Challengers Bangalore",
                        "Kolkata Knight Riders",
                        "Delhi Capitals",
                        "Punjab Kings",
                        "Gujarat Titans",
                        "Sunrisers Hyderabad",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          plyTeamName = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your team';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await FirebaseStorage.instance
                                  .ref()
                                  .child(
                                    "IPL2025/$plyTeamName/${plyNameController.text}",
                                  )
                                  .putFile(
                                    selectedImage!,
                                  );

                              final String profileURL = await FirebaseStorage
                                  .instance
                                  .ref()
                                  .child(
                                      "IPL2025/$plyTeamName/${plyNameController.text}")
                                  .getDownloadURL();

                              Map<String, dynamic> data = {
                                "playerName": plyNameController.text,
                                "playerAge": plyAgeController.text,
                                "playerJerseyNo": plyJerNoController.text,
                                "playerTeamName": plyTeamName,
                                "profilePic": profileURL
                              };

                              Future<DocumentReference<Map<String, dynamic>>>
                                  response = FirebaseFirestore.instance
                                      .collection("IPL_Teams")
                                      .add(data);

                              plyAgeController.clear();
                              plyJerNoController.clear();
                              plyNameController.clear();
                              plyTeamName = null;
                              selectedImage = null;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Form submitted successfully!'),
                                ),
                              );
                              print("DATA ADDED SUCCESS............");
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "Add Data",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              createRoute(
                                Teamselection(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "View Data",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
