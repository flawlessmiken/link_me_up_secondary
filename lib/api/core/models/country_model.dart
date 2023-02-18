// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    Country({
        this.name,
        this.dialCode,
        this.code,
    });

    String?name;
    String?dialCode;
    String?code;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        dialCode: json["dial_code"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "dial_code": dialCode,
        "code": code,
    };
}
