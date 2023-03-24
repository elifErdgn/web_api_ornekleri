import 'dart:math';

import 'package:butun_http_ornekleri/http/youtube_ornekleri/mockApi_crud/model.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static String apiEndpoint =
      "https://636bb1a87f47ef51e137cd42.mockapi.io/api/questions/Deneme1Res";
}

class ApiService {
  Future<List<QuestionsModel>?> getAllData() async {
    try {
      var Url = Uri.parse(ApiConstants.apiEndpoint);
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        var json = response.body;
        return questionsFromJson(json);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> deleteData(String id) async {
    var URL = Uri.parse(
        "https://636bb1a87f47ef51e137cd42.mockapi.io/api/questions/Deneme1Res/$id");
    final response = await http.delete(URL);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Veri silinirken hata oluştu");
    }
  }
}
