import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildInfoRow(
  BuildContext context, {
  required IconData icon,
  required String label,
  required String value,
  required VoidCallback onTap,
  bool faIcon = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: getScreenHeight(context) * 0.005),
    child: MouseRegion(
      cursor: SystemMouseCursors.click, // <- MouseCursor comes with hand
      child: GestureDetector(
        onTap: onTap, // <-- Connect the onTap here!
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: getScreenHeight(context) * 0.02,
          children: [
            Container(
              height: getScreenHeight(context) * 0.055,
              width: getScreenHeight(context) * 0.055,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 22, 22),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-0.08, -0.08),
                    color: Colors.white70,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: Colors.amber.shade400,
                size: getResponsiveFontSize(context, 18),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(
                    color: Colors.grey,
                    fontSize: getResponsiveFontSize(
                      context,
                      getResponsiveFontSize(context, 12),
                    ),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: getResponsiveFontSize(
                      context,
                      getResponsiveFontSize(context, 12),
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
