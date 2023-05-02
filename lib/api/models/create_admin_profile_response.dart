// To parse this JSON data, do
//
//     final createAdminProfileResponse = createAdminProfileResponseFromJson(jsonString);

import 'dart:convert';

CreateAdminProfileResponse createAdminProfileResponseFromJson(String str) =>
    CreateAdminProfileResponse.fromJson(json.decode(str));

String createAdminProfileResponseToJson(CreateAdminProfileResponse data) =>
    json.encode(data.toJson());

class CreateAdminProfileResponse {
  CreateAdminProfileResponse({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory CreateAdminProfileResponse.fromJson(Map<String, dynamic> json) =>
      CreateAdminProfileResponse(
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
    this.userId,
  });

  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}




