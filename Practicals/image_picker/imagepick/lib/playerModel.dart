
import 'package:flutter/material.dart';

class PlayerModel {
  final String playerName;
  final String jerseyNo;
  final String link;

  PlayerModel({
    required this.playerName,
    required this.jerseyNo,
    required this.link,
  });
  
  Map<String,dynamic> toMap(){
    return {
      'playerName': playerName,
      'jerseyNo': jerseyNo,
      'link': link,
    };
  }
}