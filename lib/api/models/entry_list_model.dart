// To parse this JSON data, do
//
//     final entryListModel = entryListModelFromJson(jsonString);

import 'dart:convert';

EntryListModel entryListModelFromJson(String str) => EntryListModel.fromJson(json.decode(str));

String entryListModelToJson(EntryListModel data) => json.encode(data.toJson());

class EntryListModel {
    int? code;
    String? message;
    List<Datum>? data;

    EntryListModel({
        this.code,
        this.message,
        this.data,
    });

    factory EntryListModel.fromJson(Map<String, dynamic> json) => EntryListModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? name;
    String? nameTag;
    String? profilePicture;
    String? time;
    int? total;

    Datum({
        this.id,
        this.name,
        this.nameTag,
        this.profilePicture,
        this.time,
        this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        time: json["time"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameTag": nameTag,
        "profilePicture": profilePicture,
        "time": time,
        "total": total,
    };
}
