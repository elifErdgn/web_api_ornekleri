import 'package:butun_http_ornekleri/dio/HWA_Login/core/auth_manager.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/core/cache_manager.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/models/userModel.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/models/user_request_model.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/screens/login/login.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homeView.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = 'https://reqres.in';

  @override
  void initState() {
    super.initState();
    loginService = LoginService(Dio(BaseOptions(baseUrl: _baseUrl)));
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(username: email, password: password));
    print(response);
    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeView()));
  }
}
