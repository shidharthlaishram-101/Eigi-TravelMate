import 'dart:convert';
import 'package:http/http.dart' as http;

class TripPlannerApi {
  // IP address of the computer running FastAPI
  static const String baseUrl = 'http://192.168.137.48:8000';

  static Future<Map<String, dynamic>> planTrip({
    required double budget,
    required int days,
    required int travelers,
    required List<String> interests,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/plan-trip'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'budget': budget,
        'days': days,
        'travelers': travelers,
        'interests': interests,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception(
      'Failed to generate trip. '
      'Status: ${response.statusCode}\n'
      '${response.body}',
    );
  }
}
