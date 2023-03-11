// To parse this JSON data, do
//
//     final userInfoResponse = userInfoResponseFromJson(jsonString);

import 'dart:convert';

UserInfoResponse userInfoResponseFromJson(String str) => UserInfoResponse.fromJson(json.decode(str));

String userInfoResponseToJson(UserInfoResponse data) => json.encode(data.toJson());

class UserInfoResponse {
    UserInfoResponse({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    Data ?data;

    factory UserInfoResponse.fromJson(Map<String, dynamic> json) => UserInfoResponse(
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
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.profilePicture,
        this.role,
        this.accountId,
    });

    String? userId;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? email;
    String? profilePicture;
    String? role;
    String? accountId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        profilePicture: json["profilePicture"],
        role: json["role"],
        accountId: json["accountId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "profilePicture": profilePicture,
        "role": role,
        "accountId": accountId,
    };
}
