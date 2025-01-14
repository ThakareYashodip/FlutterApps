import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard_page/View/analytics/notchClipper_custom.dart';
import 'package:leaderboard_page/View/analytics/piechartWithMarker_custom.dart';

class AnalyticsUI extends StatefulWidget {
  const AnalyticsUI({super.key});

  @override
  State<AnalyticsUI> createState() => _AnalyticsUIState();
}

class _AnalyticsUIState extends State<AnalyticsUI> {
  int selectedIndex = 0;
  int progressPer = 100;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 222, 248),
        leading: Builder(
          builder: (_) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_back_ios_new_rounded,
                      color: const Color.fromARGB(255, 0, 0, 0), size: 14),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge.count(
              count: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '     5x Gaurantee',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              ClipPath(
                clipper: NotchClipper(),
                child: Container(
                  height: 350,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 99, 138, 255),
                        const Color.fromARGB(255, 211, 245, 255),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '25',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    'leads per',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    'month',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  FittedBox(
                                    child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all()),
                                        child: Image.asset(
                                          "assets/user.png",
                                        )),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Satish Kadam',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      ),
                                      Text(
                                        'Premium Franchise',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 22, 22, 22),
                                        ),
                                      ),
                                      Text(
                                        'Franchise code : SK07684',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 22, 22, 22),
                                        ),
                                      ),
                                      Text(
                                        'Onboarding date : 12-11-2024',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                              255, 22, 22, 22),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //Piechart here for leadds
                              PieChartWithMarker(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey)),
                            color: const Color.fromARGB(255, 234, 250, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '01-10-2024 to 01-11-2024',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Target Lead - 25',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.green[800],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${progressPer - index * 10}%',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey)),
                            color: const Color.fromARGB(255, 237, 251, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'Total Lead',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'Successful Lead',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    Text(
                                      '14',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'Failed Lead',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    Text(
                                      '11',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(initialIndex: 1),
        bottomBar: [
          BottomBarItem(
            icon: const Icon(Icons.home, size: 35),
            iconSelected:
                const Icon(Icons.home, color: Colors.indigo, size: 35),
            title: "Home",
            // dotColor: example.AppColors.cherryRed,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              log('Home $value');
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.leaderboard, size: 35),
            iconSelected:
                const Icon(Icons.leaderboard, color: Colors.indigo, size: 35),
            title: "Leads",
            // dotColor: example.AppColors.cherryRed,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              log('Search $value');
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.person, size: 35),
            iconSelected:
                const Icon(Icons.person, color: Colors.indigo, size: 35),
            title: "Profile",
            // dotColor: example.AppColors.cherryRed,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              log('Profile $value');
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.support_agent_outlined, size: 35),
            iconSelected:
                const Icon(Icons.support_agent, color: Colors.indigo, size: 35),
            title: "Support",
            // dotColor: example.AppColors.cherryRed,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              log('Settings $value');
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: const Color.fromARGB(255, 231, 231, 231),
          centerIcon: const FloatingCenterButton(
            child: Icon(
              shadows: [
                Shadow(
                  blurRadius: 1,
                  color: Colors.indigo,
                )
              ],
              Icons.add,
              color: Colors.indigo,
              size: 35,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.home,
                color: AppColors.white,
              ),
              onTap: () => log('Item1'),
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.access_alarm,
                color: AppColors.white,
              ),
              onTap: () => log('Item2'),
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.ac_unit_outlined,
                color: AppColors.white,
              ),
              onTap: () => log('Item3'),
            ),
          ],
        ),
      ),
    );
  }
}

// FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.white,
      //   shape: CircleBorder(),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.indigo,
      //     size: 40,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       FittedBox(
      //         child: IconButton(
      //           icon: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.home_filled,
      //                 size: 30,
      //                 color: selectedIndex == 0
      //                     ? Colors.deepPurple
      //                     : Colors.indigo,
      //               ),
      //               Text(
      //                 'Home',
      //                 style: TextStyle(
      //                   fontSize: 12,
      //                   color: selectedIndex == 0
      //                       ? Colors.deepPurple
      //                       : Colors.indigo,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           onPressed: () => onItemTapped(0),
      //         ),
      //       ),
      //       FittedBox(
      //         child: IconButton(
      //           icon: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.bar_chart,
      //                 size: 30,
      //                 color: selectedIndex == 1
      //                     ? Colors.deepPurple
      //                     : Colors.indigo,
      //               ),
      //               Text(
      //                 'Leads',
      //                 style: TextStyle(
      //                   fontSize: 12,
      //                   color: selectedIndex == 1
      //                       ? Colors.deepPurple
      //                       : const Color.fromARGB(255, 70, 75, 105),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           onPressed: () => onItemTapped(1),
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       FittedBox(
      //         child: IconButton(
      //           icon: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.person_rounded,
      //                 size: 30,
      //                 color: selectedIndex == 2
      //                     ? Colors.deepPurple
      //                     : Colors.indigo,
      //               ),
      //               Text(
      //                 'Profile',
      //                 style: TextStyle(
      //                   fontSize: 12,
      //                   color: selectedIndex == 2
      //                       ? Colors.deepPurple
      //                       : Colors.indigo,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           onPressed: () => onItemTapped(2),
      //         ),
      //       ),
      //       FittedBox(
      //         child: IconButton(
      //           icon: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.support_agent_outlined,
      //                 size: 30,
      //                 color: selectedIndex == 3
      //                     ? Colors.deepPurple
      //                     : Colors.indigo,
      //               ),
      //               Text(
      //                 'Support',
      //                 style: TextStyle(
      //                   fontSize: 12,
      //                   color: selectedIndex == 3
      //                       ? Colors.deepPurple
      //                       : Colors.indigo,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           onPressed: () => onItemTapped(3),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),