import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

@injectable

class HttpManager{

  Future<List<int>?> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.12:5001/predict');
    Map<String, dynamic> body = {
      'features': features
    };
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final prediction = List<int>.from(
          json.decode(response.body)['prediction']);

      if (kDebugMode) {
        print('Prediction: $prediction');
      }
      return prediction;
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
      return null;
    }
  }


}
