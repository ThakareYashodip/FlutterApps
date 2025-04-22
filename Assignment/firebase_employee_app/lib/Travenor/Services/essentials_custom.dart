import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EssentialsCustom {
  Widget custom_Text(
      {required String msg,
      required double size,
      Color? color,
      String? fontFamily,
      FontWeight? fontweight}) {
    return Text(
      msg,
      style: GoogleFonts.getFont(fontFamily ?? "Poppins",
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: fontweight ?? FontWeight.w400),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> custom_snackBar(
    BuildContext context, {
    required String msg,
    double? size,
    FontWeight? fontweight,
    Color? color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          msg,
          style: GoogleFonts.poppins(
            fontSize: size ?? 16,
            fontWeight: fontweight ?? FontWeight.normal,
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
