// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        this.code,
        this.message,
        this.data,
    });

    int? code;
    String? message;
    Data? data;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
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
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "__v": v,
    };
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
        productId: json["productId"] == null ? null : ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId?.toJson(),
        "quantity": quantity,
        "_id": id,
    };
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
        specifications: json["specifications"] == null ? null : Specifications.fromJson(json["specifications"]),
        countInStock: json["countInStock"],
        price: json["price"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "shortName": shortName,
        "longName": longName,
        "image": image,
        "specifications": specifications?.toJson(),
        "countInStock": countInStock,
        "price": price,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
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
