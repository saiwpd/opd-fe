// To parse this JSON data, do
//
//     final PrescriptionModel = prescriptionFromJson(jsonString);

import 'dart:convert';

PrescriptionModel prescriptionFromJson(String str) =>
    PrescriptionModel.fromJson(json.decode(str));

String prescriptionToJson(PrescriptionModel data) => json.encode(data.toJson());

class PrescriptionModel {
  PrescriptionModel({
    this.id,
    this.status,
    this.draftMedicinePlans,
  });

  String? id;
  String? status;
  List<DraftMedicinePlan>? draftMedicinePlans;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
        id: json["_id"],
        status: json["status"],
        draftMedicinePlans: List<DraftMedicinePlan>.from(
            json["draftMedicinePlans"]
                .map((x) => DraftMedicinePlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "draftMedicinePlans":
            List<dynamic>.from(draftMedicinePlans!.map((x) => x.toJson())),
      };
}

class DraftMedicinePlan {
  DraftMedicinePlan({
    this.medicineName,
    this.properties,
    this.amount,
    this.dosage,
    this.dosageTimes,
    this.dosageMeals,
    this.remark,
    this.status,
    this.prescriptionId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String? medicineName;
  String? properties;
  int? amount;
  int? dosage;
  List<String>? dosageTimes;
  List<String>? dosageMeals;
  String? remark;
  String? status;
  String? prescriptionId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DraftMedicinePlan.fromJson(Map<String, dynamic> json) =>
      DraftMedicinePlan(
        medicineName: json["medicineName"],
        properties: json["properties"],
        amount: json["amount"],
        dosage: json["dosage"],
        dosageTimes: List<String>.from(json["dosageTimes"].map((x) => x)),
        dosageMeals: List<String>.from(json["dosageMeals"].map((x) => x)),
        remark: json["remark"],
        status: json["status"],
        prescriptionId: json["prescriptionId"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "properties": properties,
        "amount": amount,
        "dosage": dosage,
        "dosageTimes": List<dynamic>.from(dosageTimes!.map((x) => x)),
        "dosageMeals": List<dynamic>.from(dosageMeals!.map((x) => x)),
        "remark": remark,
        "status": status,
        "prescriptionId": prescriptionId,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
