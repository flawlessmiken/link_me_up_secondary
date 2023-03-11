// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromMap(jsonString);

import 'dart:convert';

class ApiResponse {
  ApiResponse({
    this.code,
    this.success,
    this.message,
  });
  int? code;
  String? success;
  String? message;

  factory ApiResponse.fromJson(String str) =>
      ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "code": code,
      };
}
