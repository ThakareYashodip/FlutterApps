import 'package:flutter/material.dart';

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width / 2.1 - 30, 0);
    path.arcToPoint(
      Offset(size.width / 2 + 30, 0),
      radius: Radius.circular(30),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
