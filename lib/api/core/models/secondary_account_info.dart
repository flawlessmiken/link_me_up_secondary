// To parse this JSON data, do
//
//     final secondaryAccountInfo = secondaryAccountInfoFromJson(jsonString);

import 'dart:convert';

SecondaryAccountInfo secondaryAccountInfoFromJson(String str) =>
    SecondaryAccountInfo.fromJson(json.decode(str));

class SecondaryAccountInfo {
  SecondaryAccountInfo({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory SecondaryAccountInfo.fromJson(Map<String, dynamic> json) =>
      SecondaryAccountInfo(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.name,
    this.postalCode,
    this.address,
    this.website,
    this.email,
    this.phoneNumber,
    this.nameTag,
    this.picture,
    this.category,
  });

  String? id;
  String? name;
  String? postalCode;
  String? address;
  String? website;
  String? email;
  String? phoneNumber;
  String? nameTag;
  String? picture;
  String? category;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        postalCode: json["postalCode"],
        address: json["address"],
        website: json["website"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        nameTag: json["nameTag"],
        picture: json["picture"],
        category: json["category"],
      );

  
}
