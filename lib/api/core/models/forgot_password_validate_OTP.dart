// To parse this JSON data, do
//
//     final validateForgotPasswordOtp = validateForgotPasswordOtpFromJson(jsonString);

import 'dart:convert';

ValidateForgotPasswordOtp validateForgotPasswordOtpFromJson(String str) => ValidateForgotPasswordOtp.fromJson(json.decode(str));

String validateForgotPasswordOtpToJson(ValidateForgotPasswordOtp data) => json.encode(data.toJson());

class ValidateForgotPasswordOtp {
    ValidateForgotPasswordOtp({
        this.code,
        this.message,
        this.data,
    });

    int? code;
    String? message;
    Data ?data;

    factory ValidateForgotPasswordOtp.fromJson(Map<String, dynamic> json) => ValidateForgotPasswordOtp(
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
        this.role,
    });

    String? userId;
    String? role;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "role": role,
    };
}
