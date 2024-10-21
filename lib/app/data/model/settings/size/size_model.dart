// To parse this JSON data, do
//
//     final productsizeModel = productsizeModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

ProductsizeModel productsizeModelFromJson(String str) =>
    ProductsizeModel.fromJson(json.decode(str));

String productsizeModelToJson(ProductsizeModel data) =>
    json.encode(data.toJson());

class ProductsizeModel {
  bool? status;
  String? message;
  List<SizeData>? data;

  ProductsizeModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductsizeModel.fromJson(Map<String, dynamic> json) =>
      ProductsizeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SizeData>.from(
                json["data"]!.map((x) => SizeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SizeData {
  int? id;
  String? size;
  String? mainCategory;
  int? mainCatId;
  String? procCategory;
  int? catId;
  RxBool isSelect;

  SizeData({
    this.id,
    this.size,
    this.mainCategory,
    this.mainCatId,
    this.procCategory,
    this.catId,
    required this.isSelect
  });

  factory SizeData.fromJson(Map<String, dynamic> json) => SizeData(
        id: json["id"],
        size: json["size"],
        mainCategory: json["main_category"],
        mainCatId: json["main_cat_id"],
        procCategory: json["proc_category"],
        catId: json["cat_id"],
        isSelect: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "main_category": mainCategory,
        "main_cat_id": mainCatId,
        "proc_category": procCategory,
        "cat_id": catId,
        
      };
}
