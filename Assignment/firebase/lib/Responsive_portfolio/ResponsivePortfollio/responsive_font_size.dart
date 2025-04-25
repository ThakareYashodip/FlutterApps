import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 400) {
    return baseFontSize * 0.6;
  } else if (screenWidth < 600) {
    return baseFontSize * 0.7;
  } else if (screenWidth < 800) {
    return baseFontSize * 0.8;
  } else if (screenWidth < 900) {
    return baseFontSize * 0.9;
  } else if (screenWidth < 1000) {
    return baseFontSize * 1.0;
  } else if (screenWidth < 1100) {
    return baseFontSize * 1.1;
  } else if (screenWidth < 1200) {
    return baseFontSize * 1.2;
  } else if (screenWidth < 1300) {
    return baseFontSize * 1.3;
  } else if (screenWidth < 1400) {
    return baseFontSize * 1.4;
  } else {
    return baseFontSize * 1.5;
  }
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getResponsiveWidth(BuildContext context, double factor) {
  double screenWidth = getScreenWidth(context);
  return screenWidth *
      factor; // factor is a multiplier (like 0.2 for 20% of the screen width)
}

double getResponsiveHeight(BuildContext context, double factor) {
  double screenHeight = getScreenHeight(context);
  return screenHeight *
      factor; // factor is a multiplier (like 0.1 for 10% of the screen height)
}

double getResponsiveFactor(BuildContext context, {required bool isWidth}) {
  double screenWidth = getScreenWidth(context);

  if (screenWidth < 600) {
    // Mobile
    return isWidth ? 0.15 : 0.2; // 15% width, 20% height for mobile
  } else if (screenWidth < 1200) {
    // Tablet
    return isWidth ? 0.1 : 0.15; // 10% width, 15% height for tablet
  } else {
    // Laptop/Desktop
    return isWidth ? 0.08 : 0.1; // 8% width, 10% height for desktop
  }
}