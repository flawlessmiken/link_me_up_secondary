// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

class ContactModel {
  ContactModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
    this.nameTag,
    this.profilePicture,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? nameTag;
  String? profilePicture;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "nameTag": nameTag,
        "profilePicture": profilePicture,
      };
}
