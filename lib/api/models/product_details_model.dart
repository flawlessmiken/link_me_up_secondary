// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

class ProductDetailsModel {
  ProductDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.shortName,
    this.longName,
    this.image,
    this.countInStock,
    this.price,
  });

  String? id;
  String? shortName;
  String? longName;
  String? image;
  int? countInStock;
  int? price;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        shortName: json["shortName"],
        longName: json["longName"],
        image: json["image"],
        countInStock: json["countInStock"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shortName": shortName,
        "longName": longName,
        "image": image,
        "countInStock": countInStock,
        "price": price,
      };
}
