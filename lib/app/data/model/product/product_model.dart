// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<ProductData>? data;

  ProductModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalCount": totalCount,
        "totalPages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductData {
  int? id;
  String? product;
  String? construction;
  String? proCat;
  String? brand;
  String? status;
  int? constructionId;
  int? brandId;
  int? newLaunch;
  String? artNo;
  int? mainCategoryId;
  String? mainCategory;
  int? categoryId;
  String? category;
  List<Division>? divisions;

  ProductData({
    this.id,
    this.product,
    this.construction,
    this.proCat,
    this.brand,
    this.status,
    this.constructionId,
    this.brandId,
    this.newLaunch,
    this.artNo,
    this.mainCategoryId,
    this.mainCategory,
    this.categoryId,
    this.category,
    this.divisions,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        product: json["product"],
        construction: json["construction"],
        proCat: json["pro_cat"],
        brand: json["brand"],
        status: json["status"],
        constructionId: json["construction_id"],
        brandId: json["brand_id"],
        newLaunch: json["new_launch"],
        artNo: json["art_no"],
        mainCategoryId: json["main_category_id"],
        mainCategory: json["main_category"],
        categoryId: json["category_id"],
        category: json["category"],
        divisions: json["divisions"] == null
            ? []
            : List<Division>.from(
                json["divisions"]!.map((x) => Division.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "construction": construction,
        "pro_cat": proCat,
        "brand": brand,
        "status": status,
        "construction_id": constructionId,
        "brand_id": brandId,
        "new_launch": newLaunch,
        "art_no": artNo,
        "main_category_id": mainCategoryId,
        "main_category": mainCategory,
        "category_id": categoryId,
        "category": category,
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
      };
}

class Division {
  int? proId;
  int? divisionId;
  String? divisionName;

  Division({
    this.proId,
    this.divisionId,
    this.divisionName,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        proId: json["pro_id"],
        divisionId: json["division_id"],
        divisionName: json["division_name"],
      );

  Map<String, dynamic> toJson() => {
        "pro_id": proId,
        "division_id": divisionId,
        "division_name": divisionName,
      };
}
