import 'package:flutter/material.dart';

class Todomodel {
  String title;
  String description;
  String date;

  Todomodel({required this.title,required this.description,required this.date});

  Map<String,dynamic> userData() {
    return {
      'title': title,
      'description': description,
      'date' : date,
    };
  }
}