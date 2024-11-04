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




ProductEditData productEditDataFromJson(String str) => ProductEditData.fromJson(json.decode(str));

String productEditDataToJson(ProductEditData data) => json.encode(data.toJson());

class ProductEditData {
    Product? product;
    List<Division>? divisions;

    ProductEditData({
        this.product,
        this.divisions,
    });

    factory ProductEditData.fromJson(Map<String, dynamic> json) => ProductEditData(
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        divisions: json["divisions"] == null ? [] : List<Division>.from(json["divisions"]!.map((x) => Division.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "divisions": divisions == null ? [] : List<dynamic>.from(divisions!.map((x) => x.toJson())),
    };
}

class Division {
    int? divisionId;

    Division({
        this.divisionId,
    });

    factory Division.fromJson(Map<String, dynamic> json) => Division(
        divisionId: json["division_id"],
    );

    Map<String, dynamic> toJson() => {
        "division_id": divisionId,
    };
}

class Product {
    String? id;
    String? name;
    int? constructionId;
    String? mainCategoryId;
    int? categoryId;
    int? brandId;
    String? artNo;
    int? activeStatus;
    int? newLaunch;

    Product({
        this.id,
        this.name,
        this.constructionId,
        this.mainCategoryId,
        this.categoryId,
        this.brandId,
        this.artNo,
        this.activeStatus,
        this.newLaunch,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        constructionId: json["construction_id"],
        mainCategoryId: json["main_category_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        artNo: json["art_no"],
        activeStatus: json["active_status"],
        newLaunch: json["new_launch"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "construction_id": constructionId,
        "main_category_id": mainCategoryId,
        "category_id": categoryId,
        "brand_id": brandId,
        "art_no": artNo,
        "active_status": activeStatus,
        "new_launch": newLaunch,
    };
}
