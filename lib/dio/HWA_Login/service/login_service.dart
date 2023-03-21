import 'dart:html';

import 'package:butun_http_ornekleri/dio/HWA_Login/models/user_request_model.dart';
import 'package:dio/dio.dart';

import '../models/user_response_model.dart';

abstract class ILoginService {
  final String path = "/api/login";

  ILoginService(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);

  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(
      path,
      data: model,
    );
    try{
      if(response.statusCode == HttpStatus.ok) {
        return UserResponseModel.fromJson(response.data);
      }else{
        print(response);
        return null;
      }
    }catch(e){
      print(response.data);
      print(e);
    }
  }
}
