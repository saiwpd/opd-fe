import 'dart:convert';

List<Fee> feeFromJson(String str) => List<Fee>.from(json.decode(str).map((x) => Fee.fromJson(x)));

String feeToJson(List<Fee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fee {
    Fee({
        this.invoice,
        this.reciept,
    });

    Invoice? invoice;
    Reciept? reciept;

    factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        invoice: json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
        reciept: json["reciept"] == null ? null : Reciept.fromJson(json["reciept"]),
    );

    Map<String, dynamic> toJson() => {
        "invoice": invoice?.toJson(),
        "reciept": reciept == null ? null : reciept?.toJson(),
    };
}

class Invoice {
    Invoice({
        this.id,
        this.refId,
        this.amount,
        this.status,
        this.summary,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    String? refId;
    int? amount;
    String? status;
    Summary? summary;
    String? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["_id"],
        refId: json["refId"],
        amount: json["amount"],
        status: json["status"],
        summary: Summary.fromJson(json["summary"]),
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "refId": refId,
        "amount": amount,
        "status": status,
        "summary": summary?.toJson(),
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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

class Reciept {
    Reciept({
        this.id,
        this.refId,
        this.bank,
        this.invoiceId,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    String? refId;
    String? bank;
    String? invoiceId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Reciept.fromJson(Map<String, dynamic> json) => Reciept(
        id: json["_id"],
        refId: json["refId"],
        bank: json["bank"],
        invoiceId: json["invoiceId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "refId": refId,
        "bank": bank,
        "invoiceId": invoiceId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
