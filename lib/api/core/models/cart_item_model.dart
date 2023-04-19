// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';

CartItemModel cartItemModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

class CartItemModel {
  CartItemModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.userId,
    this.items,
    this.v,
  });

  String? id;
  String? userId;
  List<Item>? items;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userId: json["userId"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        v: json["__v"],
      );
}

class Item {
  Item({
    this.productId,
    this.quantity,
    this.id,
  });

  ProductId? productId;
  int? quantity;
  String? id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        id: json["_id"],
      );
}

class ProductId {
  ProductId({
    this.id,
    this.shortName,
    this.longName,
    this.image,
    this.specifications,
    this.countInStock,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? shortName;
  String? longName;
  String? image;
  Specifications? specifications;
  int? countInStock;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        shortName: json["shortName"],
        longName: json["longName"],
        image: json["image"],
        specifications: Specifications.fromJson(json["specifications"]),
        countInStock: json["countInStock"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Specifications {
  Specifications({
    this.size,
  });

  String? size;

  factory Specifications.fromJson(Map<String, dynamic> json) => Specifications(
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
      };
}
