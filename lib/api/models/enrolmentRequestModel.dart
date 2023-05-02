// To parse this JSON data, do
//
//     final enrolmentRequestModel = enrolmentRequestModelFromJson(jsonString);

import 'dart:convert';

EnrolmentRequestModel enrolmentRequestModelFromJson(String str) => EnrolmentRequestModel.fromJson(json.decode(str));


class EnrolmentRequestModel {
    EnrolmentRequestModel({
        this.code,
        this.message,
        this.data,
    });

    int ?code;
    String? message;
    Data ?data;

    factory EnrolmentRequestModel.fromJson(Map<String, dynamic> json) => EnrolmentRequestModel(
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
        this.department,
        this.designation,
        this.mobilePhoneNumber,
        this.officePhoneNumber,
        this.workEmailAddress,
        this.staffNumber,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? profilePicture;
    String? nameTag;
    String? department;
    String? designation;
    int? mobilePhoneNumber;
    int? officePhoneNumber;
    String? workEmailAddress;
    int? staffNumber;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        nameTag: json["nameTag"],
        department: json["department"],
        designation: json["designation"],
        mobilePhoneNumber: json["mobilePhoneNumber"],
        officePhoneNumber: json["officePhoneNumber"],
        workEmailAddress: json["workEmailAddress"],
        staffNumber: json["staffNumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "nameTag": nameTag,
        "department": department,
        "designation": designation,
        "mobilePhoneNumber": mobilePhoneNumber,
        "officePhoneNumber": officePhoneNumber,
        "workEmailAddress": workEmailAddress,
        "staffNumber": staffNumber,
    };
}
