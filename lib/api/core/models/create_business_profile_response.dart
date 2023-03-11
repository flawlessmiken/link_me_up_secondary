// To parse this JSON data, do
//
//     final createBusinessProfileResponse = createBusinessProfileResponseFromJson(jsonString);

import 'dart:convert';

CreateBusinessProfileResponse createBusinessProfileResponseFromJson(String str) => CreateBusinessProfileResponse.fromJson(json.decode(str));

String createBusinessProfileResponseToJson(CreateBusinessProfileResponse data) => json.encode(data.toJson());

class CreateBusinessProfileResponse {
    CreateBusinessProfileResponse({
        this.code,
        this.message,
        this.data,
    });

    int? code;
    String ?message;
    Data ?data;

    factory CreateBusinessProfileResponse.fromJson(Map<String, dynamic> json) => CreateBusinessProfileResponse(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.accountId,
    });

    String? accountId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountId: json["accountId"],
    );

    Map<String, dynamic> toJson() => {
        "accountId": accountId,
    };
}
