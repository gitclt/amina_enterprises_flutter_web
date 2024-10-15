// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  bool? status;
  List<ProSubCategory>? data;

  SubCategoryModel({
    this.status,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ProSubCategory>.from(
                json["data"]!.map((x) => ProSubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProSubCategory {
  int? id;
  int? procatId;
  String? name;
  String? procategory;

  ProSubCategory({
    this.id,
    this.procatId,
    this.name,
    this.procategory,
  });

  factory ProSubCategory.fromJson(Map<String, dynamic> json) => ProSubCategory(
        id: json["id"],
        procatId: json["procat_id"],
        name: json["name"],
        procategory: json["procategory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "procat_id": procatId,
        "name": name,
        "procategory": procategory,
      };
}
