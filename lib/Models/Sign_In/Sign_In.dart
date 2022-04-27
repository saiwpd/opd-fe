// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

OtpExp otpFromJson(String str) => OtpExp.fromJson(json.decode(str));

String otpToJson(OtpExp data) => json.encode(data.toJson());

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

class OtpExp {
  OtpExp({
    this.otpExpireAt,
    this.id,
  });

  DateTime? otpExpireAt;
  String? id;

  factory OtpExp.fromJson(Map<String, dynamic> json) => OtpExp(
        otpExpireAt: DateTime.parse(json["otpExpireAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "otpExpireAt": otpExpireAt!.toIso8601String(),
        "_id": id,
      };
}
