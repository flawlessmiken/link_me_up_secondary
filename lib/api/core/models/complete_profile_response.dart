// To parse this JSON data, do
//
//     final completeProfileResponse = completeProfileResponseFromJson(jsonString);

import 'dart:convert';

CompleteProfileResponse completeProfileResponseFromJson(String str) =>
    CompleteProfileResponse.fromJson(json.decode(str));

String completeProfileResponseToJson(CompleteProfileResponse data) =>
    json.encode(data.toJson());

class CompleteProfileResponse {
  CompleteProfileResponse({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      CompleteProfileResponse(
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
    this.accountId,
    this.name,
    this.nameTag,
    this.picture,
    this.token,
    this.userId,
  });

  String? accountId;
  String? name;
  String? nameTag;
  String? picture;
  String? token;
  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountId: json["accountId"],
        name: json["name"],
        nameTag: json["nameTag"],
        picture: json["picture"],
        token: json["token"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "name": name,
        "nameTag": nameTag,
        "picture": picture,
        "token": token,
        "userId": userId,
      };
}
