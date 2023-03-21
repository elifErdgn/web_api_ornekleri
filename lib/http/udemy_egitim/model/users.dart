class UsersModel {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  UsersModel({this.name, this.job, this.id, this.createdAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class UsersCevap {
  int success;
  List<UsersModel> userList;

  UsersCevap(this.success, this.userList);

  factory UsersCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    List<UsersModel> userList = jsonArray
        .map((jsonArrayNesnesi) => UsersModel.fromJson(jsonArrayNesnesi))
        .toList();
    return UsersCevap(json["success"] as int, userList);
  }
}