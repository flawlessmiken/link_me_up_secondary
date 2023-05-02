// To parse this JSON data, do
//
//     final blockedUserModel = blockedUserModelFromJson(jsonString);

import 'dart:convert';

BlockedUserModel blockedUserModelFromJson(String str) => BlockedUserModel.fromJson(json.decode(str));


class BlockedUserModel {
    BlockedUserModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<Datum>? data;

    factory BlockedUserModel.fromJson(Map<String, dynamic> json) => BlockedUserModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

}

class Datum {
    Datum({
        this.id,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.nameTag,
        this.type,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? profilePicture;
    String? nameTag;
    String? type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        nameTag: json["nameTag"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "nameTag": nameTag,
        "type": type,
    };
}
