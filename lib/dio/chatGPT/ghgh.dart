import 'package:butun_http_ornekleri/dio/chatGPT/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDenemeChatgpt extends StatefulWidget {
  const DioDenemeChatgpt({Key? key}) : super(key: key);

  @override
  State<DioDenemeChatgpt> createState() => _DioDenemeChatgptState();
}

class _DioDenemeChatgptState extends State<DioDenemeChatgpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DioServv().dioIlePost2();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DioServv {
  Dio dio = Dio();

  Future<void> dioIlePost() async {
    try {
      Response response = await dio.post("https://reqres.in/api/users", data: {
        "name": "nam",
        "job": "ıgııgıg",
      });

      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> dioIlePost2() async {
    try {
      NameAndJobModel model = NameAndJobModel(name: "name", job: "example");
      Response response =
          await dio.post("https://reqres.in/api/users", data: model.toJson());
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
