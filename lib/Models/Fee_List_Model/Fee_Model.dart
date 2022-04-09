// To parse this JSON data, do
//
//     final fee = feeFromJson(jsonString);

import 'dart:convert';

List<Fee> feeFromJson(String str) => List<Fee>.from(json.decode(str).map((x) => Fee.fromJson(x)));

String feeToJson(List<Fee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fee {
    Fee({
        this.refId,
        this.amount,
        this.status,
        this.summary,
        this.createdAt,
        this.updatedAt,
        this.bank,
    });

    String? refId;
    int? amount;
    String? status;
    Summary? summary;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? bank;

    factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        refId: json["refId"],
        amount: json["amount"],
        status: json["status"],
        summary: Summary.fromJson(json["summary"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bank: json["bank"] == null ? null : json["bank"],
    );

    Map<String, dynamic> toJson() => {
        "refId": refId,
        "amount": amount,
        "status": status,
        "summary": summary?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "bank": bank == null ? null : bank,
    };
}

class Summary {
    Summary({
        this.serviceFee,
        this.medicineFee,
    });

    int? serviceFee;
    List<MedicineFee>? medicineFee;

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        serviceFee: json["serviceFee"],
        medicineFee: List<MedicineFee>.from(json["medicineFee"].map((x) => MedicineFee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "serviceFee": serviceFee,
        "medicineFee": List<dynamic>.from(medicineFee!.map((x) => x.toJson())),
    };
}

class MedicineFee {
    MedicineFee({
        this.medicineName,
        this.amount,
        this.totalPrice,
    });

    String? medicineName;
    int? amount;
    int? totalPrice;

    factory MedicineFee.fromJson(Map<String, dynamic> json) => MedicineFee(
        medicineName: json["medicineName"],
        amount: json["amount"],
        totalPrice: json["totalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "amount": amount,
        "totalPrice": totalPrice,
    };
}
