// To parse this JSON data, do
//
//     final pusherGetEntryModel = pusherGetEntryModelFromJson(jsonString);

import 'dart:convert';

PusherGetEntryModel pusherGetEntryModelFromJson(String str) =>
    PusherGetEntryModel.fromJson(json.decode(str));

String pusherGetEntryModelToJson(PusherGetEntryModel data) =>
    json.encode(data.toJson());

class PusherGetEntryModel {
  PusherGetEntryModel({
    this.id,
    this.firstName,
    this.lastName,
    this.nameTag,
    this.profilePicture,
    this.appointmentid,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? nameTag;
  String? profilePicture;
  String? appointmentid;

  factory PusherGetEntryModel.fromJson(Map<String, dynamic> json) =>
      PusherGetEntryModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nameTag: json["nameTag"],
        profilePicture: json["profilePicture"],
        appointmentid: json["appointmentid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "nameTag": nameTag,
        "profilePicture": profilePicture,
        "appointmentid": appointmentid,
      };
}
