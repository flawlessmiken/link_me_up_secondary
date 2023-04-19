// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

class NotificationModel {
  NotificationModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.nameTag,
    this.picture,
    this.title,
    this.description,
    this.read,
    this.createdAt,
  });

  String? id;
  String? nameTag;
  String? picture;
  String? title;
  String? description;
  bool? read;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nameTag: json["nameTag"],
        picture: json["picture"],
        title: json["title"],
        description: json["description"],
        read: json["read"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameTag": nameTag,
        "picture": picture,
        "title": title,
        "description": description,
        "read": read,
        "createdAt": createdAt?.toIso8601String(),
      };
}
