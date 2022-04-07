import 'dart:convert';

List<Medicine> medicineFromJson(String str) => List<Medicine>.from(json.decode(str).map((x) => Medicine.fromJson(x)));

String medicineToJson(List<Medicine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicine {
    Medicine({
        this.id,
        this.name,
        this.weight,
    });

    String? id;
    String? name;
    int? weight;

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["_id"],
        name: json["name"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "weight": weight,
    };
}
