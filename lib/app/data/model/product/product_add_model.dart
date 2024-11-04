// To parse this JSON data, do
//
//     final productAddModel = productAddModelFromJson(jsonString);

import 'dart:convert';

ProductAddModel productAddModelFromJson(String str) =>
    ProductAddModel.fromJson(json.decode(str));

String productAddModelToJson(ProductAddModel data) =>
    json.encode(data.toJson());

class ProductAddModel {
  String? id;
  String? name;
  String? constructionId;
  String? categoryId;
  String? brandId;
  String? artNo;
  String? status;
  String? newLaunch;
  String? mainCategoryId;

  ProductAddModel({
    this.id,
    this.name,
    this.constructionId,
    this.categoryId,
    this.brandId,
    this.artNo,
    this.status,
    this.newLaunch,
    this.mainCategoryId,
  });

  factory ProductAddModel.fromJson(Map<String, dynamic> json) =>
      ProductAddModel(
        id: json["id"],
        name: json["name"],
        constructionId: json["construction_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        artNo: json["art_no"],
        status: json["status"],
        newLaunch: json["new_launch"],
        mainCategoryId: json["main_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "name": name,
        "construction_id": constructionId,
        "category_id": categoryId,
        "brand_id": brandId,
        "art_no": artNo,
        "status": status,
        "new_launch": newLaunch,
        "main_category_id": mainCategoryId,
      };
}
