/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 14/11/21<br/>
 * Time: 10:01<br/>
 */

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DonorModel welcomeFromJson(String str) => DonorModel.fromJson(json.decode(str));

String DonorModelToJson(DonorModel data) => json.encode(data.toJson());

class DonorModel {
  DonorModel({
    this.email,
    this.fullName,
    this.bloodType,
    this.phoneNumber,
    this.location,
    this.time

  });

  String ?email;
  String ?fullName;
  String ?bloodType;
  String ?phoneNumber;
  String ?location;
  String ?time;

  factory DonorModel.fromJson(Map<String, dynamic> json) => DonorModel(
    email: json["email"],
    fullName: json["full_name"],
    bloodType: json["blood_type"],
    phoneNumber: json["phone_number"],
    location: json["location"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "full_name": fullName,
    "blood_type": bloodType,
    "phone_number": phoneNumber,
    "location": location,
    "time": time
  };
}
