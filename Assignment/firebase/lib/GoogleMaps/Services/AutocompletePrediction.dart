class Autocompleteprediction {
  final String? description;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;

  Autocompleteprediction({
    this.description,
    this.placeId,
    this.reference,
    this.structuredFormatting,
  });

  factory Autocompleteprediction.fromJson(Map<String, dynamic> json) {
    return Autocompleteprediction(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }
}

class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}
