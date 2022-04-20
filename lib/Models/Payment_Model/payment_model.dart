// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    PaymentModel({
        this.refId,
        this.bank,
    });

    String? refId;
    String? bank;

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        refId: json["refId"],
        bank: json["bank"],
    );

    Map<String, dynamic> toJson() => {
        "refId": refId,
        "bank": bank,
    };
}
