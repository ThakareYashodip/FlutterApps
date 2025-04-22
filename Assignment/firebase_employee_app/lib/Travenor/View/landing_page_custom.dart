import 'dart:developer';

import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:firebase_employee_app/Travenor/View/Authentication/SignUP.dart';
import 'package:firebase_employee_app/Travenor/View/Authentication/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPageCustom extends StatefulWidget {
  const LandingPageCustom({super.key});

  @override
  State<LandingPageCustom> createState() => _LandingPageCustomState();
}

class _LandingPageCustomState extends State<LandingPageCustom> {
  final _controller = PageController();
  int _currentPage = 0;
  List data = [
    {
      "image":
          "https://s3-alpha-sig.figma.com/img/c1e4/ba3b/67f22654585ff11a4df323a8bbfe0e11?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZCn30mJH2riZ0xFgNMGD0YG7fTRz2XRmbmCpS1Ez9KU4WYiN7WX8yM5KcKsgImZ3p9vjleJ6V5bP5GwQoVg3k2XFN8IZ9aT4Z841z089HJHy5bAtKehCWlI05WGhujzFSpg1ZQNlPFyV6muaEt8EJKRrn7FYTsEpsmnn0GXybxWY2AHRJBkKakSPhkRQRxwCEWhqBV5KLOVS5BPr1bI26uj-PKyQS3HrjcOIcWA8IxOhqIwHRlXSdmig6T3GTEn0UfYT8m~mqsMV4ahOL3FxYPhQNSrJvXtoyoPFHXixHd6l8vb0etajneGNluZ2qKmCOUL7UOC9AKPgk~eh1NbhKg__",
      "title1": "Life is short and the world is",
      "title2": " wide",
      "subtitle":
          "At Friends tours and travel, we customize reliable and trut worthy educational tours to destinations",
      "buttonText": "Get Started",
    },
    {
      "image":
          "https://s3-alpha-sig.figma.com/img/37b7/5355/22e19db565db3d0e628d8a5d911da05c?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=b~47XgbnZ3LaKKvzXdjxBt7yKOlDaG1isahGlB7KEuFVny7Yud8TC4NV9h7URA~oRYH7p4LbOrRngjEuKvyR54mRZKw1u4IWsRYyBHwhM~KJDHNfr2ToGRcl9Jc7Aj3uZIE--CVmPWylp7ZFBaXa6ZW0zpwPWmY~6fqE77P4s-A7igVHoxmYuBPV6yCjS3N6bETCkDHWGNMkkW0sSgiRw2whQh~~HJlTc8tna5T3LHm~mCCaKOYX6y~Zg1bTeM6qKMnfPPaSlQYxRoq7O1fGf6391b8QDN9c3eqCkBZ3xgC3~leL2e4DDzpkom3se4Q4QxRiBxsveJ2JKzJrY9OhqQ__",
      "title1": "It’s a big world out there go",
      "title2": " explore",
      "subtitle":
          "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
      "buttonText": "Next",
    },
    {
      "image":
          "https://s3-alpha-sig.figma.com/img/9f53/1f12/4f1808d3e428799712a47e9ae41fa48b?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NHbS4pESnUbpBrFd1~8iie~rGfHghkBpcma4mBEQnOd6ZRYc9hCjax6pJS5jk~R8p6HMpIfE1nwfWFJrjY~GbjCOxLgneXmab3u5hTsQYY~U7lEtkgJWyK7bx6fhPKVXWEdes9k6hApPfmxLuMyEtQiTA4~DOFn5uketaRId2Mt7EtgQM1PgVEEU5cpiTe4CdC7Yxz2Ji3Oz1EYNC0H6HrOuB44JVuRz~6pSYUThPDToCWhzIBKf-Ihi8CyGXuUSXGiYHl1gexbc5I9XOvfVwmuuqrHVZ-nQZkGB-UL5RKuP655Cer2DIfyfLvSAyVRBRKzCdd5Qas6qhcPKLotLEg__",
      "title1": "People don’t take trips, trips take",
      "title2": " people",
      "subtitle":
          "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
      "buttonText": "Next",
    }
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(data[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: data[index]["title1"],
                              style: GoogleFonts.aclonica(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: data[index]["title2"],
                              style: GoogleFonts.aclonica(
                                  fontSize: 26,
                                  color: Color.fromRGBO(255, 112, 41, 1),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      data[index]["subtitle"],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromRGBO(125, 132, 141, 1),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 80),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: data.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color.fromRGBO(13, 110, 253, 1),
                        dotColor: Color.fromRGBO(186, 216, 255, 1),
                      ),
                      onDotClicked: (index) {
                        setState(
                          () {
                            _currentPage = index;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage < data.length) {
                          _currentPage++;
                          setState(() {});
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInTravenor(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(13, 110, 253, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: EssentialsCustom().custom_Text(
                            msg: data[index]["buttonText"],
                            size: 16,
                            color: Colors.white,
                            fontweight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
