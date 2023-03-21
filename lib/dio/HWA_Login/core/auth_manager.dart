import 'package:butun_http_ornekleri/dio/HWA_Login/models/userModel.dart';
import 'package:flutter/cupertino.dart';

import 'cache_manager.dart';


class AuthenticationManager extends CacheManager {
  BuildContext context;

  AuthenticationManager({
    required this.context,
  });

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
