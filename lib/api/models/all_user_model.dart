// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
    AllUserModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<Datum>? data;

    factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.firstName,
        this.lastName,
        this.role,
        this.profilePicture,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? role;
    String? profilePicture;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: json["role"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "role": role,
        "profilePicture": profilePicture,
    };
}
