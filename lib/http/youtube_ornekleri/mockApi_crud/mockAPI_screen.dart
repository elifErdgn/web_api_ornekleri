import 'package:butun_http_ornekleri/http/youtube_ornekleri/mockApi_crud/mockapi_service.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class MockApiScreen extends StatefulWidget {
  const MockApiScreen({Key? key}) : super(key: key);

  @override
  State<MockApiScreen> createState() => _MockApiScreenState();
}

class _MockApiScreenState extends State<MockApiScreen> {
  ApiService apiService = ApiService();
  List<QuestionsModel>? listQuestion = [];
  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    listQuestion = await apiService.getAllData();
    if (listQuestion != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  void deleteData(String id) async {
    final response = await apiService.deleteData(id);
    if (response == true) {
      setState(() {
        getData();
      });
    } else {
      print("silinemedi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoading,
        replacement: Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
          itemCount: listQuestion?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(listQuestion![index].name),
                leading: Icon(Icons.face),
                onLongPress: (){
                  deleteData(listQuestion![index].id);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
