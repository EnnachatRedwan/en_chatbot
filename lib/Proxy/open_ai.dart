import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenAi {
  static Future<String> getResponse(String message) async {
    final url = Uri(
      scheme: 'http',
      host: '172.30.31.38',
      port: 3000,
      queryParameters: {"message": message},
    );
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data['message'];
  }
}
