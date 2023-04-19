// To parse this JSON data, do
//
//     final entryDetailsModel = entryDetailsModelFromJson(jsonString);

import 'dart:convert';

HistoryDetailsModel historyDetailsModelFromJson(String str) =>
    HistoryDetailsModel.fromJson(json.decode(str));

class HistoryDetailsModel {
  HistoryDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.name,
    this.nameTag,
    this.profilePicture,
    this.userType,
    this.personalContact,
    this.entryRecords,
    this.appointments,
  });

  String? name;
  String? nameTag;
  String? profilePicture;
  String? userType;
  PersonalContact? personalContact;
  List<EntryRecord>? entryRecords;
  List<Appointment>? appointments;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        userType: json["userType"],
        personalContact: PersonalContact.fromJson(json["personalContact"]),
        entryRecords: List<EntryRecord>.from(
            json["entryRecords"].map((x) => EntryRecord.fromJson(x))),
        appointments: List<Appointment>.from(
            json["appointments"].map((x) => Appointment.fromJson(x))),
      );
}

class Appointment {
  Appointment({
    this.id,
    this.title,
    this.startTime,
    this.endTime,
    this.organiser,
    this.address,
  });

  String? id;
  String? title;
  String? startTime;
  String? endTime;
  String? organiser;
  String? address;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        title: json["title"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        organiser: json["organiser"],
        address: json["address"],
      );

}

class EntryRecord {
  EntryRecord({
    this.entryType,
    this.date,
    this.time,
  });

  String? entryType;
  String? date;
  String? time;

  factory EntryRecord.fromJson(Map<String, dynamic> json) => EntryRecord(
        entryType: json["entryType"],
        date: json["date"],
        time: json["time"],
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
