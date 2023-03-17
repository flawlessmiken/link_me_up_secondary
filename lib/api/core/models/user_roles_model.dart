// To parse this JSON data, do
//
//     final userRoles = userRolesFromJson(jsonString);

import 'dart:convert';

UserRoles userRolesFromJson(String str) => UserRoles.fromJson(json.decode(str));

String userRolesToJson(UserRoles data) => json.encode(data.toJson());

class UserRoles {
    UserRoles({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<String>? data;

    factory UserRoles.fromJson(Map<String, dynamic> json) => UserRoles(
        code: json["code"],
        message: json["message"],
        data: List<String>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
    };
}
