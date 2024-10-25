// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  List<ProductData>? data;

  ProductModel({
    this.status,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
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
   int? stateId;
  String? stateName;
  int? itemId;
  int? subCatId;
  String? subCat;
  int? colorId;
  String? color;

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
      this.stateId,
    this.stateName,
    this.itemId,
    this.subCatId,
    this.subCat,
    this.colorId,
    this.color,
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
         stateId: json["state_id"],
        stateName: json["state_name"],
        itemId: json["item_id"],
        subCatId: json["sub_cat_id"],
        subCat: json["sub_cat"],
        colorId: json["color_id"],
        color: json["color"],
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
        "state_id": stateId,
        "state_name": stateName,
        "item_id": itemId,
        "sub_cat_id": subCatId,
        "sub_cat": subCat,
        "color_id": colorId,
        "color": color,
      };
}
