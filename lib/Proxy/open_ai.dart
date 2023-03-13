import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenAi {
  static Future<String> getResponse(String message) async {
    final url = Uri(
      scheme: 'https',
      host: 'en-chat-bot.onrender.com',
      port: 3000,
      queryParameters: {"message": message},
    );
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data['message'];
  }
}
