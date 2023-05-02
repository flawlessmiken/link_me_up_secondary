// To parse this JSON data, do
//
//     final notificationDetailsModel = notificationDetailsModelFromJson(jsonString);

import 'dart:convert';

NotificationDetailsModel notificationDetailsModelFromJson(String str) => NotificationDetailsModel.fromJson(json.decode(str));


class NotificationDetailsModel {
    NotificationDetailsModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    Data ? data;

    factory NotificationDetailsModel.fromJson(Map<String, dynamic> json) => NotificationDetailsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

   
}

class Data {
    Data({
        this.id,
        this.accountId,
        this.nameTag,
        this.picture,
        this.title,
        this.description,
        this.body,
        this.type,
        this.data,
        this.read,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? accountId;
    String? nameTag;
    String? picture;
    String? title;
    String? description;
    String? body;
    String? type;
    String? data;
    bool? read;
    DateTime ?createdAt;
    DateTime? updatedAt;
    int? v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        accountId: json["accountId"],
        nameTag: json["nameTag"],
        picture: json["picture"],
        title: json["title"],
        description: json["description"],
        body: json["body"],
        type: json["type"],
        data: json["data"],
        read: json["read"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

  
}
