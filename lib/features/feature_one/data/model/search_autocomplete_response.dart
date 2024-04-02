// the autocomplete response contains place, predictions and status

import 'dart:convert';

import 'autocomplete_predictions.dart';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePredictions>? predictions;

  PlaceAutoCompleteResponse({
    this.status,
    this.predictions,
  });

  factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? json['predictions']
              .map<AutoCompletePredictions>(
                  (json) => AutoCompletePredictions.fromJson(json))
              .toList()
          : null,
    );
  }

  static PlaceAutoCompleteResponse parseAutoCompleteResponse(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();

    return PlaceAutoCompleteResponse.fromJson(parsed);
  }
}
