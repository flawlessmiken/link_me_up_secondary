// To parse this JSON data, do
//
//     final contactDetailsModel = contactDetailsModelFromJson(jsonString);

import 'dart:convert';

ContactDetailsModel contactDetailsModelFromJson(String str) => ContactDetailsModel.fromJson(json.decode(str));


class ContactDetailsModel {
    ContactDetailsModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    Data ?data;

    factory ContactDetailsModel.fromJson(Map<String, dynamic> json) => ContactDetailsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

}

class Data {
    Data({
        this.firstName,
        this.lastName,
        this.nameTag,
        this.profilePicture,
        this.personalContact,
    });

    String? firstName;
    String? lastName;
    String? nameTag;
    String? profilePicture;
    PersonalContact ? personalContact;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"],
        lastName: json["lastName"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        personalContact: PersonalContact.fromJson(json["personalContact"]),
    );


}

class PersonalContact {
    PersonalContact({
        this.phoneNumber,
        this.email,
        this.website,
    });

    int? phoneNumber;
    String? email;
    String? website;

    factory PersonalContact.fromJson(Map<String, dynamic> json) => PersonalContact(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "email": email,
        "website": website,
    };
}
