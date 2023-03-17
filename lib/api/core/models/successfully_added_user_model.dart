// To parse this JSON data, do
//
//     final successfullAddedUserModel = successfullAddedUserModelFromJson(jsonString);

import 'dart:convert';

SuccessfullAddedUserModel successfullAddedUserModelFromJson(String str) => SuccessfullAddedUserModel.fromJson(json.decode(str));


class SuccessfullAddedUserModel {
    SuccessfullAddedUserModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    Data ? data;

    factory SuccessfullAddedUserModel.fromJson(Map<String, dynamic> json) => SuccessfullAddedUserModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

  
}

class Data {
    Data({
        this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.role,
        this.profilePicture,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? email;
    String? role;
    String? profilePicture;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        role: json["role"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "role": role,
        "profilePicture": profilePicture,
    };
}
