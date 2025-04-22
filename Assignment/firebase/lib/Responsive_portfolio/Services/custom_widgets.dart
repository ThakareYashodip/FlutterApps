import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customStyledText(
    BuildContext context, String label, Color fontColor, double? fontsize) {
  return Text(
    label,
    textAlign: TextAlign.justify,
    style: GoogleFonts.dmSans(
      color: fontColor,
      fontSize: getResponsiveFontSize(
        context,
        getResponsiveFontSize(context, fontsize!),
      ),
      fontWeight: FontWeight.w600,
    ),
  );
}
