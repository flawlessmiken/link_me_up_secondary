// To parse this JSON data, do
//
//     final allClockInModel = allClockInModelFromJson(jsonString);

import 'dart:convert';

AllClockInModel allClockInModelFromJson(String str) => AllClockInModel.fromJson(json.decode(str));


class AllClockInModel {
    AllClockInModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<clockIn>? data;

    factory AllClockInModel.fromJson(Map<String, dynamic> json) => AllClockInModel(
        code: json["code"],
        message: json["message"],
        data: List<clockIn>.from(json["data"].map((x) => clockIn.fromJson(x))),
    );

   
}

class clockIn {
    clockIn({
        this.id,
        this.name,
        this.nameTag,
        this.profilePicture,
        this.userType,
        this.entryType,
        this.time,
    });

    String? id;
    String? name;
    String? nameTag;
    String? profilePicture;
    String? userType;
    String? entryType;
    String? time;

    factory clockIn.fromJson(Map<String, dynamic> json) => clockIn(
        id: json["id"],
        name: json["name"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        userType: json["userType"],
        entryType: json["entryType"],
        time: json["time"],
    );

    
}
