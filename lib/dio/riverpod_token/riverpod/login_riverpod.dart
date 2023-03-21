import 'package:butun_http_ornekleri/dio/riverpod_token/screens/homePpage.dart';
import 'package:butun_http_ornekleri/dio/riverpod_token/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = ApiService();
  TextEditingController emailCONT = TextEditingController();
  TextEditingController passwordCONT = TextEditingController();
  final box = GetStorage();

  void fetch(){
    loadingPopup();
    service.loginCall(email: emailCONT.text, password: passwordCONT.text).then((value) {
      if(value != null && value.status! == true){
        box.write("token", value.token);
        print("Kaydedlen token ${box.read("token")}");
        Grock.back();
        Grock.toRemove(RiverHome());
      }else{
        Grock.back();
        Grock.snackBar(title: "Hata", description: value?.message ?? "Bir Sorun oluştu, tekrar dene");
      }
    });
  }

}

void loadingPopup() {
  Grock.dialog(builder: (_) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}
