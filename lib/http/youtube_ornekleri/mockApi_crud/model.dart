import 'dart:convert';

List<QuestionsModel> questionsFromJson(String str) => List<QuestionsModel>.from(
    json.decode(str).map((x) => QuestionsModel.fromJson(x)));

class QuestionsModel {
  String name;
  String opta;
  String optb;
  String optc;
  String optd;
  String id;

  QuestionsModel({
    required this.name,
    required this.opta,
    required this.optb,
    required this.optc,
    required this.optd,
    required this.id,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> Json) => QuestionsModel(
    id: Json["id"],
    name: Json["name"],
    opta: Json["id"],
    optb: Json["id"],
    optc: Json["id"],
    optd: Json["id"],
  );
}
