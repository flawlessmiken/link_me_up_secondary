// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));


class AllProductModel {
    AllProductModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    List<Datum>? data;

    factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

  
}

class Datum {
    Datum({
        this.id,
        this.shortName,
    });

    String? id;
    String? shortName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        shortName: json["shortName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shortName": shortName,
    };
}
