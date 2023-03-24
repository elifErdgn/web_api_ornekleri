import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'http/youtube_ornekleri/request_butonlari/http_list_screen.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';


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
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         Provider<AuthenticationManager>(
//           create: (context) => AuthenticationManager(context: context),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: SplashView(),
//     );
//   }
// }


///ilk denemeler
void main() async {
  //  await UserPreferences.init();

  runApp( ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      home:  HttpListScreens(),
    );
  }
}
