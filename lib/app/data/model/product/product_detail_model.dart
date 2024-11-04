// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  bool? status;
  List<ProductDetail>? data;

  ProductDetailModel({
    this.status,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ProductDetail>.from(json["data"]!.map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductDetail {
  int? id;
  int? proId;
  String? product;
  String? color;
  String? status;
  int? isDisplay;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  int? mrp;
  int? sizeId;
  String? size;
  int? stock;
  String? subcategory;
  int? subCatId;
  int? stateId;
  String? state;
    String? image1Url;
  String? image2Url;
  String? image3Url;
  String? image4Url;
  dynamic image5Url;

  ProductDetail({
    this.id,
    this.proId,
    this.product,
    this.color,
    this.status,
    this.isDisplay,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.mrp,
    this.sizeId,
    this.size,
    this.stock,
    this.subcategory,
    this.subCatId,
     this.stateId,
    this.state,
      this.image1Url,
    this.image2Url,
    this.image3Url,
    this.image4Url,
    this.image5Url,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        proId: json["pro_id"],
        product: json["product"],
        color: json["color"],
        status: json["status"],
        isDisplay: json["is_display"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        mrp: json["mrp"],
        sizeId: json["size_id"],
        size: json["size"],
        stock: json["stock"],
        subcategory: json["subcategory"],
        subCatId: json["sub_cat_id"],
        stateId: json["state_id"],
        state: json["state"],
                image1Url: json["image1_url"],
        image2Url: json["image2_url"],
        image3Url: json["image3_url"],
        image4Url: json["image4_url"],
        image5Url: json["image5_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pro_id": proId,
        "product": product,
        "color": color,
        "status": status,
        "is_display": isDisplay,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "mrp": mrp,
        "size_id": sizeId,
        "size": size,
        "stock": stock,
        "subcategory": subcategory,
        "sub_cat_id": subCatId,
        "state_id": stateId,
        "state": state,
         "image1_url": image1Url,
        "image2_url": image2Url,
        "image3_url": image3Url,
        "image4_url": image4Url,
        "image5_url": image5Url,
      };
}
