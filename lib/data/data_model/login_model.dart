// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? usrId;
  String? usrName;
  String? password;

  LoginModel({
    this.usrId,
    this.usrName,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    usrId: json["usrId"],
    usrName: json["usrName"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "usrId": usrId,
    "usrName": usrName,
    "Password": password,
  };
}
