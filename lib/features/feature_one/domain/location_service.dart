import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hungro_food_delivery/features/feature_one/data/model/search_autocomplete_response.dart';
import 'package:hungro_food_delivery/utils/constants/app_constants.dart';

import '../data/model/autocomplete_predictions.dart';

class LocationService extends ChangeNotifier {
  List<AutoCompletePredictions> placePredictions = [];

  void placeAutoComplete(String query) async {
    Uri uri = Uri.https(
        'maps.googleapis.com',
        '/maps/api/place/autocomplete/json', // unecoded path
        {
          'input': query, // query parameter
          'key': AppKeys.mapKeyAll,
        });

    // making a GET request

    String? response = await fetchUrlResponse(uri);

    if (response != null) {
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.parseAutoCompleteResponse(response);

      if (result.predictions != null) {
        placePredictions = result.predictions!;
        notifyListeners();
      }
    }
  }

  Future<String?> fetchUrlResponse(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
