import 'package:flutter/material.dart';

class Utilities {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}

// Method to create a custom snackbar
SnackBar customSnackBar({
  required Widget widget,
}) {
  return SnackBar(
    backgroundColor: const Color.fromARGB(255, 231, 244, 255),
    content: widget,
    duration: const Duration(
      seconds: 2,
    ),
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(10),
    // showCloseIcon: true,
    // closeIconColor: const Color.fromARGB(255, 255, 17, 0),
  );
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const ResponsiveText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontColor,
      required this.fontWeight,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double responsiveFontSize = fontSize;

    if (screenWidth < 400) {
      responsiveFontSize = fontSize * 0.8;
    } else if (screenWidth < 600) {
      responsiveFontSize = fontSize * 0.9;
    } else if (screenWidth < 800) {
      responsiveFontSize = fontSize * 1.0;
    } else if (screenWidth < 1000) {
      responsiveFontSize = fontSize * 1.1;
    } else {
      responsiveFontSize = fontSize * 1.2;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: responsiveFontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
