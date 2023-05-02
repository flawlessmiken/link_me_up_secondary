// To parse this JSON data, do
//
//     final walletTransactionModel = walletTransactionModelFromJson(jsonString);

import 'dart:convert';

WalletTransactionModel walletTransactionModelFromJson(String str) => WalletTransactionModel.fromJson(json.decode(str));

String walletTransactionModelToJson(WalletTransactionModel data) => json.encode(data.toJson());

class WalletTransactionModel {
    int? code;
    String? message;
    List<Datum>? data;

    WalletTransactionModel({
        this.code,
        this.message,
        this.data,
    });

    factory WalletTransactionModel.fromJson(Map<String, dynamic> json) => WalletTransactionModel(
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
    int? amount;
    String? description;
    String? time;
    String? date;
    String? status;

    Datum({
        this.id,
        this.amount,
        this.description,
        this.time,
        this.date,
        this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        description: json["description"],
        time: json["time"],
        date: json["date"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "description": description,
        "time": time,
        "date": date,
        "status": status,
    };
}
