// To parse this JSON data, do
//
//     final directoryDetailsModel = directoryDetailsModelFromJson(jsonString);

import 'dart:convert';

DirectoryDetailsModel directoryDetailsModelFromJson(String str) =>
    DirectoryDetailsModel.fromJson(json.decode(str));

class DirectoryDetailsModel {
  DirectoryDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory DirectoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      DirectoryDetailsModel(
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
    this.profilePicture,
    this.nameTag,
    this.personalContact,
    this.businessContact,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? nameTag;
  PersonalContact? personalContact;
  BusinessContact? businessContact;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        nameTag: json["nameTag"],
        personalContact: PersonalContact.fromJson(json["personalContact"]),
        businessContact: BusinessContact.fromJson(json["businessContact"]),
      );
}

class BusinessContact {
  BusinessContact({
    this.department,
    this.designation,
    this.mobilePhoneNumber,
    this.officePhoneNumber,
    this.workEmailAddress,
    this.staffNumber,
  });

  String? department;
  String? designation;
  int? mobilePhoneNumber;
  int? officePhoneNumber;
  String? workEmailAddress;
  dynamic staffNumber;

  factory BusinessContact.fromJson(Map<String, dynamic> json) =>
      BusinessContact(
        department: json["department"],
        designation: json["designation"],
        mobilePhoneNumber: json["mobilePhoneNumber"],
        officePhoneNumber: json["officePhoneNumber"],
        workEmailAddress: json["workEmailAddress"],
        staffNumber: json["staffNumber"],
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

  factory PersonalContact.fromJson(Map<String, dynamic> json) =>
      PersonalContact(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        website: json["website"],
      );
}
