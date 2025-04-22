import 'dart:convert';

import 'package:firebase/GoogleMaps/Services/AutocompletePrediction.dart';

class Placecompleteresponse {
  final List<Autocompleteprediction>? predictions;

  Placecompleteresponse({this.predictions});

  factory Placecompleteresponse.parseAutoCompleteResult(String response) {
    final jsonData = json.decode(response);
    final predictionsJson = jsonData['predictions'] as List;
    final predictionsList =
        predictionsJson.map((e) => Autocompleteprediction.fromJson(e)).toList();

    return Placecompleteresponse(predictions: predictionsList);
  }
}
