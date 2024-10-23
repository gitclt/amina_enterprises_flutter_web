// To parse this JSON data, do
//
//     final proAddresponseModel = proAddresponseModelFromJson(jsonString);

import 'dart:convert';

ProAddresponseModel proAddresponseModelFromJson(String str) =>
    ProAddresponseModel.fromJson(json.decode(str));

String proAddresponseModelToJson(ProAddresponseModel data) =>
    json.encode(data.toJson());

class ProAddresponseModel {
  bool? status;
  String? message;
  Data? data;

  ProAddresponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProAddresponseModel.fromJson(Map<String, dynamic> json) =>
      ProAddresponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  int? constructionId;
  int? mainCategoryId;
  int? categoryId;
  int? brandId;
  String? artNo;
  int? newLaunch;
  dynamic status;

  Data({
    this.id,
    this.name,
    this.constructionId,
    this.mainCategoryId,
    this.categoryId,
    this.brandId,
    this.artNo,
    this.newLaunch,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        constructionId: json["construction_id"],
        mainCategoryId: json["main_category_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        artNo: json["art_no"],
        newLaunch: json["new_launch"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "construction_id": constructionId,
        "main_category_id": mainCategoryId,
        "category_id": categoryId,
        "brand_id": brandId,
        "art_no": artNo,
        "new_launch": newLaunch,
        "status": status,
      };
}
