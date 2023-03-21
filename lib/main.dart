import 'package:butun_http_ornekleri/dio/riverpod_token/screens/splash_Screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';

import 'dio/HWA_Login/core/auth_manager.dart';

/// riverpod main
/*
void main() async {
  await GetStorage.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tum Http Ornekleri',
      navigatorKey: Grock.navigationKey,
      home: SplashScreen(),
      // home: DioDenemeChatgpt(),
    );
  }
}

 */

/// HWA - LOGİN MAİN

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationManager>(
          create: (context) => AuthenticationManager(context: context),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashView(),
    );
  }
}
