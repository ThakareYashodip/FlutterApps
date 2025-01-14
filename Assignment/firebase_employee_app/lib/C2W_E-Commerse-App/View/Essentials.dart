import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Essentials {
  double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  Widget textCustom({
    required String message,
    required String fontType,
    Color? color,
    required double size,
    required FontWeight fontWeight,
  }) {
    return Text(
      message,
      style: GoogleFonts.getFont(
        fontType,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
