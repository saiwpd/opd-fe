// To parse this JSON data, do
//
//     final medicinePlanModel = medicinePlanModelFromJson(jsonString);

import 'dart:convert';

MedicinePlanModel medicinePlanModelFromJson(String str) => MedicinePlanModel.fromJson(json.decode(str));

String medicinePlanModelToJson(MedicinePlanModel data) => json.encode(data.toJson());

class MedicinePlanModel {
    MedicinePlanModel({
        this.draftMedicinePlans,
        this.patientId,
        this.doctorId,
    });

    List<DraftMedicinePlan>? draftMedicinePlans;
    String? patientId;
    String? doctorId;

    factory MedicinePlanModel.fromJson(Map<String, dynamic> json) => MedicinePlanModel(
        draftMedicinePlans: List<DraftMedicinePlan>.from(json["draftMedicinePlans"].map((x) => DraftMedicinePlan.fromJson(x))),
        patientId: json["patientId"],
        doctorId: json["doctorId"],
    );

    Map<String, dynamic> toJson() => {
        "draftMedicinePlans": List<dynamic>.from(draftMedicinePlans!.map((x) => x.toJson())),
        "patientId": patientId,
        "doctorId": doctorId,
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
    int? amount;
    int? dosage;
    List<String>? dosageTimes;
    List<String>? dosageMeals;
    String? remark;
    int? weight;

    factory DraftMedicinePlan.fromJson(Map<String, dynamic> json) => DraftMedicinePlan(
        id: json["_id"],
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
        "_id": id,
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
