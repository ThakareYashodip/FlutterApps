import 'package:flutter/material.dart';

class customSnackBar{

  customSnackBar({
    required String message , required BuildContext context
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black
        ),
      ),
      backgroundColor: Colors.white,
      )
    );
  }
}