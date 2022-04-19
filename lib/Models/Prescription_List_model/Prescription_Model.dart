// To parse this JSON data, do
//
//     final prescriptionListModel = prescriptionListModelFromJson(jsonString);

import 'dart:convert';

List<Prescription> prescriptionListModelFromJson(String str) => List<Prescription>.from(json.decode(str).map((x) => Prescription.fromJson(x)));

String prescriptionListModelToJson(List<Prescription> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prescription {
    Prescription({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.patientId,
        this.doctorId,
    });

    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    Status? status;
    String? patientId;
    String? doctorId;

    factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"] == null ? null : statusValues.map[json["status"]],
        patientId: json["patientId"] == null ? null : json["patientId"],
        doctorId: json["doctorId"] == null ? null : json["doctorId"],
    );//PrescriptionListModel

    Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "status": status == null ? null : statusValues.reverse[status],
        "patientId": patientId == null ? null : patientId,
        "doctorId": doctorId == null ? null : doctorId,
    };
}

enum Status { CREATED }

final statusValues = EnumValues({
    "CREATED": Status.CREATED
});

class EnumValues<T> {
    Map<String, T> map = <String, T>{};
    Map<T, String> reverseMap = <T, String>{};

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
