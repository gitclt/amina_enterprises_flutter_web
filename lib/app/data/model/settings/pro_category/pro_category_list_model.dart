// To parse this JSON data, do
//
//     final proCategoryListModel = proCategoryListModelFromJson(jsonString);

import 'dart:convert';

ProCategoryListModel proCategoryListModelFromJson(String str) =>
    ProCategoryListModel.fromJson(json.decode(str));

String proCategoryListModelToJson(ProCategoryListModel data) =>
    json.encode(data.toJson());

class ProCategoryListModel {
  bool? status;
  String? message;
  List<ProCategoryListData>? data;

  ProCategoryListModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProCategoryListModel.fromJson(Map<String, dynamic> json) =>
      ProCategoryListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProCategoryListData>.from(json["data"]!.map((x) => ProCategoryListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProCategoryListData {
  int? id;
  String? name;

ProCategoryListData({
    this.id,
    this.name,
  });

  factory ProCategoryListData.fromJson(Map<String, dynamic> json) =>
      ProCategoryListData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
