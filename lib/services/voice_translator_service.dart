import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class VoiceTranslatorService {
  // Replace with your computer's IPv4 address.
  static const String baseUrl = 'http://172.20.10.9:8000';

  static Future<Map<String, dynamic>> sendAudio(File audioFile) async {
    final uri = Uri.parse('$baseUrl/translate-voice');

    final request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath('audio', audioFile.path),
    );

    final response = await request.send();

    final responseBody = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw Exception('Server error ${response.statusCode}: $responseBody');
    }

    return jsonDecode(responseBody);
  }
}
