import 'package:flutter/material.dart';

scaffoldMessngerCustom(String message,context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
