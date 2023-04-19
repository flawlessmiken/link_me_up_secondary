// To parse this JSON data, do
//
//     final directoryModel = directoryModelFromJson(jsonString);

import 'dart:convert';

DirectoryModel directoryModelFromJson(String str) => DirectoryModel.fromJson(json.decode(str));


class DirectoryModel {
    DirectoryModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<Datum>? data;

    factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
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

   
}
