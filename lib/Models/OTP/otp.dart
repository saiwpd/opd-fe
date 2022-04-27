import 'dart:convert';

SendOtp sendOtpFromJson(String str) => SendOtp.fromJson(json.decode(str));
String sendOtpToJson(SendOtp data) => json.encode(data.toJson());
GetProfile getProfileFromJson(String str) =>
    GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class SendOtp {
  SendOtp({
    this.id,
    this.otp,
  });

  String? id;
  String? otp;

  factory SendOtp.fromJson(Map<String, dynamic> json) => SendOtp(
        id: json["_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "otp": otp,
      };
}

class GetProfile {
  GetProfile({
    this.id,
    this.username,
    this.password,
    this.role,
    this.otp,
    this.otpExpireAt,
    this.updatedAt,
    this.errormessege,
  });

  String? id;
  String? username;
  String? password;
  String? role;
  String? otp;
  DateTime? otpExpireAt;
  DateTime? updatedAt;
  String? errormessege;

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        otp: json["otp"],
        otpExpireAt: DateTime.parse(json["otpExpireAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        errormessege: json["errormessege"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "password": password,
        "role": role,
        "otp": otp,
        "otpExpireAt": otpExpireAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "errormessege": errormessege,
      };
}
