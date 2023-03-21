/*
* class UserRequestModel {
  String? email;
  String? password;

  UserRequestModel({this.email, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
*/

/*
class UserRequestModel {
  String? username;
  String? password;

  UserRequestModel({this.username, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}

 */

class UserRequestModel {
  String? grantType;
  String? username;
  String? password;

  UserRequestModel({this.grantType, this.username, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grant_type'] = this.grantType;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}