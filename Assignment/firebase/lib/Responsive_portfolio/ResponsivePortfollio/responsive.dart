import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  const Responsive({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1100;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 500 &&
      MediaQuery.of(context).size.width <= 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
