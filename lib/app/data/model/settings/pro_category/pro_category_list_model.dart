// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromJson(jsonString);

import 'dart:convert';

ProductCategoryModel productCategoryModelFromJson(String str) =>
    ProductCategoryModel.fromJson(json.decode(str));

String productCategoryModelToJson(ProductCategoryModel data) =>
    json.encode(data.toJson());

class ProductCategoryModel {
  bool? status;
  String? message;
  List<ProductCategory>? data;

  ProductCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProductCategory>.from(
                json["data"]!.map((x) => ProductCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductCategory {
  String? id;
  String? category;

  ProductCategory({
    this.id,
    this.category,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
      };
}
