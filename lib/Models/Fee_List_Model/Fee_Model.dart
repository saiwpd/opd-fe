// To parse this JSON data, do
//
//     final feeModel = feeModelFromJson(jsonString);

import 'dart:convert';

List<FeeModel> feeModelFromJson(String str) => List<FeeModel>.from(json.decode(str).map((x) => FeeModel.fromJson(x)));

String feeModelToJson(List<FeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeModel {
    FeeModel({
        this.refId,
        this.price,
        this.status,
        this.summary,
        this.createdAt,
        this.updatedAt,
        this.bank,
    });

    String? refId;
    int? price;
    String? status;
    Summary? summary;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? bank;

    factory FeeModel.fromJson(Map<String, dynamic> json) => FeeModel(
        refId: json["refId"],
        price: json["price"],
        status: json["status"],
        summary: Summary.fromJson(json["summary"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bank: json["bank"] == null ? null : json["bank"],
    );

    Map<String, dynamic> toJson() => {
        "refId": refId,
        "price": price,
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
        this.price,
    });

    String? medicineName;
    int? amount;
    int? price;

    factory MedicineFee.fromJson(Map<String, dynamic> json) => MedicineFee(
        medicineName: json["medicineName"],
        amount: json["amount"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "amount": amount,
        "price": price,
    };
}
