// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel registrationModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String registrationModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  int? usrId;
  String? password;
  String? confirmPassword;

  ChangePasswordModel({
    this.usrId,
    this.password,
    this.confirmPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    usrId: json["usrId"],
    password: json["Password"],
    confirmPassword: json["confirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "usrId": usrId,
    "Password": password,
    "confirmPassword": confirmPassword,
  };
}
