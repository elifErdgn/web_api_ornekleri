import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/riverpod_managnment.dart';


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: ref.read(loginRiverpod).emailCONT,
                decoration: InputDecoration(
                  hintText: "Mail adresinizi giriniz",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: ref.read(loginRiverpod).passwordCONT,
                decoration: InputDecoration(
                  hintText: "Şifrenizi giriniz",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            InkWell(
              onTap: () => ref.read(loginRiverpod).fetch(),
              child: Container(
                color: Colors.teal,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: Text("GİRİŞ YAP"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
