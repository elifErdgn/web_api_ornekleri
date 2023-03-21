import 'package:butun_http_ornekleri/dio/HWA_Login/core/auth_manager.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/core/cache_manager.dart';
import 'package:butun_http_ornekleri/dio/HWA_Login/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';
  late UserModel? userModel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            userModel?.name ?? 'boş',
          ),
        ],
      ),
    );
  }
}
