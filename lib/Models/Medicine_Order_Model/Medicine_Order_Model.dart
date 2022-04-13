// To parse this JSON data, do
//
//     final medicineOrderModel = medicineOrderModelFromJson(jsonString);

import 'dart:convert';

MedicineOrderModel medicineOrderModelFromJson(String str) => MedicineOrderModel.fromJson(json.decode(str));

String medicineOrderModelToJson(MedicineOrderModel data) => json.encode(data.toJson());

class MedicineOrderModel {
    MedicineOrderModel({
        this.draftMedicinePlans,
    });

    List<DraftMedicinePlan>? draftMedicinePlans;

    factory MedicineOrderModel.fromJson(Map<String, dynamic> json) => MedicineOrderModel(
        draftMedicinePlans: List<DraftMedicinePlan>.from(json["draftMedicinePlans"].map((x) => DraftMedicinePlan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "draftMedicinePlans": List<dynamic>.from(draftMedicinePlans!.map((x) => x.toJson())),
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
        this.weight,
    });

    String? medicineName;
    String? properties;
    int? amount;
    int? dosage;
    List<String>? dosageTimes;
    List<String>? dosageMeals;
    String? remark;
    int? weight;

    factory DraftMedicinePlan.fromJson(Map<String, dynamic> json) => DraftMedicinePlan(
        medicineName: json["medicineName"],
        properties: json["properties"],
        amount: json["amount"],
        dosage: json["dosage"],
        dosageTimes: List<String>.from(json["dosageTimes"].map((x) => x)),
        dosageMeals: List<String>.from(json["dosageMeals"].map((x) => x)),
        remark: json["remark"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "properties": properties,
        "amount": amount,
        "dosage": dosage,
        "dosageTimes": List<dynamic>.from(dosageTimes!.map((x) => x)),
        "dosageMeals": List<dynamic>.from(dosageMeals!.map((x) => x)),
        "remark": remark,
        "weight": weight,
    };
}
