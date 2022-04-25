// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class SignIn {
  SignIn({this.username, this.password});

  String? username;
  String? password;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class Otp {
  Otp({
    this.otpExpireAt,
    this.id,
  });

  DateTime? otpExpireAt;
  String? id;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        otpExpireAt: DateTime.parse(json["otpExpireAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "otpExpireAt": otpExpireAt!.toIso8601String(),
        "_id": id,
      };
}
