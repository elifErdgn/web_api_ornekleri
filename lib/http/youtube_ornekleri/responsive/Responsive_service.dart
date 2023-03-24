import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Categories.dart';
import 'model/Product.dart';

 
class RespoService {
  Future<List<Category>> fetchCategories() async {
    var apiUrl =
        Uri.https("https://5f210aa9daa42f001666535e.mockapi.io/api/categories");

    /// const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      List<Category> categories = (json.decode(response.body) as List)
          .map((data) => Category.fromJson(data))
          .toList();
      print(categories);
      return categories;
    } else {
      throw Exception("Yükleme Hatası");
    }
  }

  Future<List<Product>> fetchProducts() async {
    var apiUrl = Uri.http( "https://5f210aa9daa42f001666535e.mockapi.io/api/products");

    final response  =await http.get(apiUrl);

    if(response.statusCode == 200) {
      List<Product> products = (json.decode(response.body) as List).map((data) => Product.fromJson(data)).toList();
      return products;
    }else {
      throw Exception("Yükleme Başarısız");
    }
  }

}
