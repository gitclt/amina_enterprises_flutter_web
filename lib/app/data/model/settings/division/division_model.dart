// To parse this JSON data, do
//
//     final divisionModel = divisionModelFromJson(jsonString);

import 'dart:convert';

DivisionModel divisionModelFromJson(String str) =>
    DivisionModel.fromJson(json.decode(str));

String divisionModelToJson(DivisionModel data) => json.encode(data.toJson());

class DivisionModel {
  bool? status;
  String? message;
  List<Division>? data;

  DivisionModel({
    this.status,
    this.message,
    this.data,
  });

  factory DivisionModel.fromJson(Map<String, dynamic> json) => DivisionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Division>.from(json["data"]!.map((x) => Division.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Division {
  String? id;
  String? division;

  Division({
    this.id,
    this.division,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        id: json["id"],
        division: json["division"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "division": division,
      };
}
