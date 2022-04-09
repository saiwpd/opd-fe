// To parse this JSON data, do
//
//     final medicinePlan = medicinePlanFromJson(jsonString);

import 'dart:convert';

MedicineOrderModel medicinePlanFromJson(String str) =>
    MedicineOrderModel.fromJson(json.decode(str));

String medicinePlanToJson(MedicineOrderModel data) =>
    json.encode(data.toJson());

class MedicineOrderModel {
  MedicineOrderModel({
    this.draftMedicinePlans,
  });

  List<DraftMedicinePlan>? draftMedicinePlans;

  factory MedicineOrderModel.fromJson(Map<String, dynamic> json) =>
      MedicineOrderModel(
        draftMedicinePlans: json["draftMedicinePlans"] == null
            ? null
            : List<DraftMedicinePlan>.from(json["draftMedicinePlans"]
                .map((x) => DraftMedicinePlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draftMedicinePlans": draftMedicinePlans == null
            ? null
            : List<dynamic>.from(draftMedicinePlans!.map((x) => x.toJson())),
      };
}

class DraftMedicinePlan {
  DraftMedicinePlan({
    this.id,
    this.medicineName,
    this.properties,
    this.amount,
    this.dosage,
    this.dosageTimes,
    this.dosageMeals,
    this.remark,
    this.weight,
  });

  String? id;
  String? medicineName;
  String? properties;
  int? weight;
  int? amount;
  int? dosage;
  List<String>? dosageTimes;
  List<String>? dosageMeals;
  String? remark;

  factory DraftMedicinePlan.fromJson(Map<String, dynamic> json) =>
      DraftMedicinePlan(
        id: json["_id"] == null ? null : json["_id"],
        medicineName:
            json["medicineName"] == null ? null : json["medicineName"],
        properties: json["properties"] == null ? null : json["properties"],
        amount: json["amount"] == null ? null : json["amount"],
        dosage: json["dosage"] == null ? null : json["dosage"],
        dosageTimes: json["dosageTimes"] == null
            ? null
            : List<String>.from(json["dosageTimes"].map((x) => x)),
        dosageMeals: json["dosageMeals"] == null
            ? null
            : List<String>.from(json["dosageMeals"].map((x) => x)),
        remark: json["remark"] == null ? null : json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "medicineName": medicineName == null ? null : medicineName,
        "properties": properties == null ? null : properties,
        "amount": amount == null ? null : amount,
        "dosage": dosage == null ? null : dosage,
        "dosageTimes": dosageTimes == null
            ? null
            : List<String>.from(dosageTimes!.map((x) => x)),
        "dosageMeals": dosageMeals == null
            ? null
            : List<String>.from(dosageMeals!.map((x) => x)),
        "remark": remark == null ? null : remark,
      };
}
