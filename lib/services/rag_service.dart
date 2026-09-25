import 'dart:convert';
import 'package:flutter/services.dart';

class RagService {
  static List<dynamic>? _destinations;

  /// Loads the tourism knowledge base.
  static Future<void> initialize() async {
    if (_destinations != null) return;

    final jsonString = await rootBundle.loadString(
      'assets/data/manipur_tourism.json',
    );

    final data = jsonDecode(jsonString);

    _destinations = data['destinations'] as List<dynamic>;
  }

  /// Retrieves tourism information relevant to the user's question.
  static Future<String> retrieveContext(String question) async {
    await initialize();

    final query = question.toLowerCase();

    final words = query
        .replaceAll(RegExp(r'[^\w\s]'), ' ')
        .split(RegExp(r'\s+'))
        .where((word) => word.length > 2)
        .toList();

    final results = <Map<String, dynamic>>[];

    for (final destination in _destinations!) {
      final keywords = (destination['keywords'] as List<dynamic>)
          .map((e) => e.toString().toLowerCase())
          .toList();

      final name = destination['name'].toString().toLowerCase();
      final location = destination['location'].toString().toLowerCase();
      final category = destination['category'].toString().toLowerCase();

      int score = 0;

      for (final word in words) {
        if (keywords.contains(word)) {
          score += 3;
        }

        if (name.contains(word)) {
          score += 4;
        }

        if (location.contains(word)) {
          score += 2;
        }

        if (category.contains(word)) {
          score += 2;
        }
      }

      if (score > 0) {
        results.add({'data': destination, 'score': score});
      }
    }

    results.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));

    // Take only the most relevant results.
    final topResults = results.take(3).toList();

    if (topResults.isEmpty) {
      return '';
    }

    final context = StringBuffer();

    for (final result in topResults) {
      final destination = result['data'];

      final airportAccess =
          destination['airport_access'] as Map<String, dynamic>?;

      final airportName =
          airportAccess?['airport'] ?? 'Bir Tikendrajit International Airport';

      final distance = airportAccess?['distance_km'];

      final distanceType = airportAccess?['distance_type'] ?? 'not_verified';

      final travelTime = airportAccess?['approx_travel_time'];

      context.writeln('''
Destination: ${destination['name']}
Location: ${destination['location']}
Category: ${destination['category']}
Description: ${destination['description']}
Distance from $airportName: ${distance ?? 'Not verified'}
Distance information type: $distanceType
Approximate travel time from airport: ${travelTime ?? 'Not available'}
Highlights: ${(destination['highlights'] as List<dynamic>).join(', ')}
''');
    }

    return context.toString();
  }
}
