import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 400) {
    return baseFontSize * 0.7;
  } else if (screenWidth < 600) {
    return baseFontSize * 0.8;
  } else if (screenWidth < 800) {
    return baseFontSize * 0.9;
  } else if (screenWidth < 1000) {
    return baseFontSize * 1.0;
  } else {
    return baseFontSize * 1.1;
  }
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
