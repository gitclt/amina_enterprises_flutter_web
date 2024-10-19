// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  int? pageSize;
  int? currentPage;
  List<ProductData>? data;

  ProductModel({
    this.status,
    this.pageSize,
    this.currentPage,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        pageSize: json["pageSize"],
        currentPage: json["currentPage"],
        data: json["data"] == null
            ? []
            : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "pageSize": pageSize,
        "currentPage": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductData {
  String? productName;
  int? productId;
  String? constructionName;
  int? constructionId;
  String? proCatName;
  int? categoryId;
  String? artNo;
  int? brandId;
  String? brandName;
  int? addedBy;
  int? newLaunch;
  List<ProductItem>? productItems;

  ProductData({
    this.productName,
    this.productId,
    this.constructionName,
    this.constructionId,
    this.proCatName,
    this.categoryId,
    this.artNo,
    this.brandId,
    this.brandName,
    this.addedBy,
    this.newLaunch,
    this.productItems,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        productName: json["product_name"],
        productId: json["product_id"],
        constructionName: json["construction_name"],
        constructionId: json["construction_id"],
        proCatName: json["pro_cat_name"],
        categoryId: json["category_id"],
        artNo: json["art_no"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        addedBy: json["added_by"],
        newLaunch: json["new_launch"],
        productItems: json["product_items"] == null
            ? []
            : List<ProductItem>.from(
                json["product_items"]!.map((x) => ProductItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_id": productId,
        "construction_name": constructionName,
        "construction_id": constructionId,
        "pro_cat_name": proCatName,
        "category_id": categoryId,
        "art_no": artNo,
        "brand_id": brandId,
        "brand_name": brandName,
        "added_by": addedBy,
        "new_launch": newLaunch,
        "product_items": productItems == null
            ? []
            : List<dynamic>.from(productItems!.map((x) => x.toJson())),
      };
}

class ProductItem {
  String? colour;
  List<Size>? sizes;

  ProductItem({
    this.colour,
    this.sizes,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        colour: json["colour"],
        sizes: json["sizes"] == null
            ? []
            : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "colour": colour,
        "sizes": sizes == null
            ? []
            : List<dynamic>.from(sizes!.map((x) => x.toJson())),
      };
}

class Size {
  String? size;
  int? mrp;

  Size({
    this.size,
    this.mrp,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "mrp": mrp,
      };
}
