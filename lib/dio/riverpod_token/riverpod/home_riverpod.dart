import 'package:butun_http_ornekleri/dio/riverpod_token/services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:grock/grock.dart';

import '../models/task_model.dart';

class HomeRiverpod extends ChangeNotifier {
  List<TaskModelDataNotComplated?> datas = [];
  final service = ApiService();
  bool isLoading = false;

  void getData() {
    isLoading = true;
    service.taskCall().then((value) {
      if (value != null && value.status == true) {
        datas = value.data!.notComplated!;

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        Grock.snackBar(title: "HATA", description: "BİR SORUN OLUŞTU");
      }
    });
  }
}
