import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Json_Token extends StatefulWidget {
  const Login_Json_Token({Key? key}) : super(key: key);

  @override
  State<Login_Json_Token> createState() => _Login_Json_TokenState();
}

class _Login_Json_TokenState extends State<Login_Json_Token> {
  final formKey = GlobalKey<FormState>();
  User? user;
  DateTime? birthday;
  List<String> pets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class User {
  final String id;
  final String name;

  User({
    this.id = '',
    this.name = '',
  });

  User copy({
    String? id,
    String? name,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  static User fromJson(Map<String, dynamic> json) =>
      User(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
      };
}


class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());  //07.14
  }



  static User? getUser(String idUser)  {
    final json = _preferences!.getString(idUser);

    return User.fromJson(jsonDecode(json!));
  }
}