import 'package:url_launcher/url_launcher.dart';

class MapsService {
  /// Opens Google Maps and searches for the given place.
  static Future<void> openPlace({
    required String placeName,
    required String location,
  }) async {
    final query = '$placeName, $location';

    final Uri url = Uri.https('www.google.com', '/maps/search/', {
      'api': '1',
      'query': query,
    });

    print('Google Maps URL: $url');

    final bool opened = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    if (!opened) {
      throw Exception('Could not open Google Maps');
    }
  }

  /// Opens Google Maps directions to the given destination.
  static Future<void> openDirections({
    required String placeName,
    required String location,
  }) async {
    final query = '$placeName, $location';

    final Uri url = Uri.https('www.google.com', '/maps/dir/', {
      'api': '1',
      'destination': query,
    });

    print('Google Maps Directions URL: $url');

    final bool opened = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    if (!opened) {
      throw Exception('Could not open Google Maps');
    }
  }
}
