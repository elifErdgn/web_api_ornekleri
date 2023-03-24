import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    "https://636bb1a87f47ef51e137cd42.mockapi.io/api/questions";

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': ' Bearer **=',
      'api_key': '**' ,
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': ' Bearer **=',
      'Content-Type': 'application/json',
      'api_key': '**',
    };

    var response = await client.post(url, headers: _headers, body: _payload);
    if (response.statusCode == 201) {
      return response.body;
    } else {}
  }

  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': ' Bearer **=',
      'Content-Type': 'application/json',
      'api_key': '**',
    };

    var response = await client.put(url, headers: _headers, body: _payload);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': ' Bearer **=',
      'Content-Type': 'application/json',
      'api_key': '**',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }
} 
