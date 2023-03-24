import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const apiUrl = 'https://example.com/api';

class Auth {
  static Future<String?> login(String email, password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      await saveToken(token);
      return token;
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<Map<String, dynamic>> loginWithHeaders(
      String email, String password) async {
    var url = Uri.parse('https://example.com/login');
    var response = await http.post(
      url,
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> user = json.decode(response.body);
      saveToken(user['token']);
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<void> register(String email, password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      //kayıt başarılı ise ?
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.getString('token');
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}

//
// headers kullanma
// Headers in an HTTP POST request are used to provide additional information about the content being sent to the server. Headers contain metadata about the request and may provide context for how the server should handle the request.
//
// For example, the Content-Type header specifies the format of the request payload. When making a POST request to a server with a JSON payload, you would typically set the Content-Type header to application/json.
//
// Other headers, such as the Authorization header, are used for authentication purposes. In a login page, for example, you may include an Authorization header to send a token or credentials to the server for authentication.
//
// Headers can also be used to provide caching information, compression preferences, and more.
//
// In summary, headers in an HTTP POST request provide additional information about the request and its content, which can help the server handle the request appropriately.
