// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.name,
    this.lastName,
    this.age,
    this.color,
    this.id,
  });

  String? name;
  String? lastName;
  int? age;
  String? color;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"] == null ? null : json["name"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    age: json["age"] == null ? null : json["age"],
    color: json["color"] == null ? null : json["color"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "lastName": lastName == null ? null : lastName,
    "age": age == null ? null : age,
    "color": color == null ? null : color,
    "id": id == null ? null : id,
  };
}
