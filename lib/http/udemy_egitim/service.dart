import 'dart:convert';

import 'package:butun_http_ornekleri/http/udemy_egitim/model/kisilerModel_cevap.dart';
import 'package:butun_http_ornekleri/http/udemy_egitim/model/users.dart';

import 'model/KisilerModel.dart';
import 'package:http/http.dart' as http;

class UdemyOrnekService {
  /// VERİ GETİRME
  List<Kisiler> parseKisilerCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriGoster() async {
    var liste = await tumKisiler();
    for (var k in liste) {
      print("********");
      print("kisi id: ${k.kisi_id}");
      print("kisi ad: ${k.kisi_ad}");
      print("kisi tel: ${k.kisi_tel}");
    }
  }

  /// VERİ EKLEME
  List<UsersModel> parseKisiEklemeCevap(String cevap) {
    return UsersCevap.fromJson(json.decode(cevap)).userList;
  }

  Future<void> kisiEkle(String kisi_AD, String kisi_TEL) async {
    var addUrl = Uri.parse("https://reqres.in/api/users");
    var veri = {"name": kisi_AD, "job": kisi_TEL};
    var cevap = await http.post(addUrl, body: veri);
    print("Veri ekleme cevap: ${cevap.body}");
  }

  /// VERİ SİLME

  List<Kisiler> parseKisiSilCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<void> kisiSil(int kisiId) async {
    var silURL = Uri.parse("https://reqres.in/api/users/${kisiId}");
    var response = http.delete(silURL);
    print("Silme işlemi başarıılı ${response}");
    }


 /// KİŞİ GÜNCELLEŞTİRME

  List<Kisiler> parseKisiGuncellesCevap (String cevap){

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_ad,kisi_tel) async{
    var updateURL = Uri.parse("https://reqres.in/api/users/${kisi_id}");
    var veriler = {
      "id":kisi_id.toString(),
      "name":kisi_ad,
      "job":kisi_tel
    };
    var response = http.put(updateURL,body:veriler );
    print(response);

  }



  /// VERİ ARAMA

  List<Kisiler> parseKisiAramaCevap(String cevap){

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
    var url = Uri.parse("json_link_arama");
    var veri = {"kisi_ad": aramaKelimesi};

    var cevap = await http.post(url, body: veri);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiGoster2()async {
    var liste = await kisilerAra("a");
    for(var k in liste){
      print("*********");
      print("kişi id: ${k.kisi_id}");
      print("kişi ad: ${k.kisi_ad}");
      print("kişi tel: ${k.kisi_tel}");
    }
  }

}
