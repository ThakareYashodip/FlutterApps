import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase/Flight_Finder_App/Views/Authentication-1/flight_finder_SignIn.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FlightFinderSplashscreen extends StatefulWidget {
  const FlightFinderSplashscreen({super.key});

  @override
  State<FlightFinderSplashscreen> createState() =>
      _FlightFinderSplashscreenState();
}

class _FlightFinderSplashscreenState extends State<FlightFinderSplashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        centered: true,
        splashIconSize: Utilities.screenWidth * 0.5,
        splash: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          child: Lottie.asset('assets/Recipes/AniAirplane.json',
              fit: BoxFit.fitHeight, alignment: Alignment.center),
        ),
        nextScreen: const FlightFinderSignin(),
        splashTransition: SplashTransition.scaleTransition,
        duration: 2000,
      ),
    );
  }
}
