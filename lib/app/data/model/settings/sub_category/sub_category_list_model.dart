// To parse this JSON data, do
//
//     final subCategoryListModel = subCategoryListModelFromJson(jsonString);

import 'dart:convert';

SubCategoryListModel subCategoryListModelFromJson(String str) =>
    SubCategoryListModel.fromJson(json.decode(str));

String subCategoryListModelToJson(SubCategoryListModel data) =>
    json.encode(data.toJson());

class SubCategoryListModel {
  bool? status;
  String? message;
  List<SubCategoryData>? data;

  SubCategoryListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SubCategoryListModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubCategoryData>.from(json["data"]!.map((x) => SubCategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubCategoryData{
  String? catname;
  int? catId;
  int? subcatId;
  String? subcatname;

  SubCategoryData({
    this.catname,
    this.catId,
    this.subcatId,
    this.subcatname,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => SubCategoryData(
        catname: json["catname"],
        catId: json["cat_id"],
        subcatId: json["subcat_id"],
        subcatname: json["subcatname"],
      );

  Map<String, dynamic> toJson() => {
        "catname": catname,
        "cat_id": catId,
        "subcat_id": subcatId,
        "subcatname": subcatname,
      };
}
