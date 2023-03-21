import 'package:butun_http_ornekleri/dio/riverpod_token/screens/homePpage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (box.read("token") != null) {
        Grock.toRemove(RiverHome());
      } else {
        Grock.toRemove(LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.safety_check_outlined,
          size: 60,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
