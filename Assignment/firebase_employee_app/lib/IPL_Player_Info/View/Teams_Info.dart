import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IplTeams extends StatefulWidget {
  final String teamName;
  const IplTeams({super.key, required this.teamName});

  @override
  State<IplTeams> createState() => _IplTeamsState();
}

class _IplTeamsState extends State<IplTeams> {
  List data = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection("IPL_Teams").get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> doc = response.docs;
      for (var value in doc) {
        if (value.data()["playerTeamName"] == widget.teamName) {
          data.add(value);
        }
      }

      setState(() {
        isLoading = false;
        log("TEAMNAME : ${widget.teamName}");
        for (var element in data) {
          log("PLAYER NAME : ${element.data()["playerName"]}");
        }
      });
    } catch (e) {
      log("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8FF),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(
              Icons.sports_cricket_rounded,
              size: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                "Player's Information . . .",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitSpinningLines(color: Colors.black),
            )
          : data.isEmpty
              ? Center(
                  child: Text(
                    "No Players found.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 20,
                      children: [
                        FittedBox(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Team Name : ${widget.teamName}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 0, 113, 158),
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var teamData = data[index].data();
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 194, 237, 255),
                                    const Color.fromARGB(255, 255, 255, 244),
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Player Image
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color.fromARGB(
                                              255, 33, 170, 243),
                                          const Color.fromARGB(
                                              255, 255, 137, 34),
                                          const Color.fromARGB(
                                              255, 238, 235, 70),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              teamData['profilePic'] ??
                                                  Center(
                                                    child: SpinKitSpinningLines(
                                                        color: Colors.black),
                                                  ),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 15),
                                  // Player Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name: ${teamData['playerName'] ?? 'N/A'}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Age: ${teamData['playerAge'] ?? 'N/A'}",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Jersey No: ${teamData['playerJerseyNo'] ?? 'N/A'}",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Team: ${teamData['playerTeamName'] ?? 'N/A'}",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      // data.removeAt(index);
                                      try {
                                        // Deleting the document from Firestore
                                        await FirebaseFirestore.instance
                                            .collection("IPL_Teams")
                                            .doc(data[index].id)
                                            .delete();

                                        // Deleting the corresponding file from Firebase Storage
                                        await FirebaseStorage.instance
                                            .ref()
                                            .child(
                                                "IPL2025/${teamData['playerTeamName']}/${teamData['playerName']}")
                                            .delete();

                                        log("Data deleted from 'DATABASE' and 'CLOUD STORAGE' successfully.");
                                        setState(() {
                                          fetchData();
                                        });
                                        log('Player Name: ${teamData['playerName']} & Team Name: ${teamData['playerTeamName']}');
                                      } catch (e) {
                                        log("Error occurred while deleting data: $e");
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      size: 30,
                                      color: Color.fromARGB(255, 255, 83, 83),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
/*
 try {
      // Fetching data from Firestore
      QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection("IPL_Teams").get();

      // Fetching URLs from Firebase Storage
      ListResult listResult = await FirebaseStorage.instance
          .ref()
          .child("IPL2025/IPL_TEAMS_BG")
          .listAll();
      List<Future<String>> futureURLs =
          listResult.items.map((item) => item.getDownloadURL()).toList();
      List<String> teamsURL = await Future.wait(futureURLs);
      // Logging URLs
      log("Teams URL: $teamsURL");

      // Setting state with fetched data
      setState(() {
        data = response.docs;
        isLoading = false;
      });
    } catch (e) {
      // Handling errors and logging
      log("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    } */
