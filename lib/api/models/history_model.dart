// To parse this JSON data, do
//
//     final guestHistoryDetails = guestHistoryDetailsFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelsFromJson(String str) => HistoryModel.fromJson(json.decode(str));


class HistoryModel {
    HistoryModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<Datum>? data;

    factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

   
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.nameTag,
        this.profilePicture,
        this.date,
        this.total,
    });

    String? id;
    String? name;
    String? nameTag;
    String? profilePicture;
    DateTime ?date;
    int ?total;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        date: DateTime.parse(json["date"]),
        total: json["total"],
    );

    
}
