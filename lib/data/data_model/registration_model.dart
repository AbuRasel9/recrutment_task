import 'dart:convert';

// To parse this JSON data, do
// final registrationModel = registrationModelFromJson(jsonString);

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  int? usrId;
  String? usrName;
  String? password;
  String? mobile;
  String? firstName;
  String? lastName;

  RegistrationModel({
    this.usrId,
    this.usrName,
    this.password,
    this.mobile,
    this.firstName,
    this.lastName,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        usrId: json["usrId"],
        usrName: json["usrName"],
        password: json["password"], // Ensure consistency here
        mobile: json["mobile"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
    "usrId": usrId,
    "usrName": usrName,
    "password": password, // Ensure consistency here
    "mobile": mobile,
    "firstName": firstName,
    "lastName": lastName,
  };
}
