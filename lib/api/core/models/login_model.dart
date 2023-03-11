// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.role,
    this.userId,
  });

  String? token;
  String? role;
  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        role: json["role"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "role": role,
        "userId": userId,
      };
}
