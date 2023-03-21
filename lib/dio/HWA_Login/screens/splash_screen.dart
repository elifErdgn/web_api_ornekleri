import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/auth_manager.dart';
import '../models/userModel.dart';
import 'homeView.dart';
import 'login/login.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await readAuthManager.fetchUserLogin();

    if (readAuthManager.isLogin) {
      await Future.delayed(Duration(seconds: 1));
      readAuthManager.model = UserModel.fake();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeView(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login(),
      ));
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
