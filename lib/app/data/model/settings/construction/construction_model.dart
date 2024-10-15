// To parse this JSON data, do
//
//     final constructionModel = constructionModelFromJson(jsonString);

import 'dart:convert';

ConstructionModel constructionModelFromJson(String str) =>
    ConstructionModel.fromJson(json.decode(str));

String constructionModelToJson(ConstructionModel data) =>
    json.encode(data.toJson());

class ConstructionModel {
  bool? status;
  String? message;
  List<Construction>? data;

  ConstructionModel({
    this.status,
    this.message,
    this.data,
  });

  factory ConstructionModel.fromJson(Map<String, dynamic> json) =>
      ConstructionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Construction>.from(
                json["data"]!.map((x) => Construction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Construction {
  int? id;
  String? name;

  Construction({
    this.id,
    this.name,
  });

  factory Construction.fromJson(Map<String, dynamic> json) => Construction(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
