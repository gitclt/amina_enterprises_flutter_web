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
  List<Datum>? data;

  ProductDetailModel({
    this.status,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? proId;
  String? product;
  String? color;
  String? status;
  int? brandId;
  int? isDisplay;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  int? mrp;

  Datum({
    this.id,
    this.proId,
    this.product,
    this.color,
    this.status,
    this.brandId,
    this.isDisplay,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.mrp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        proId: json["pro_id"],
        product: json["product"],
        color: json["color"],
        status: json["status"],
        brandId: json["brand_id"],
        isDisplay: json["is_display"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pro_id": proId,
        "product": product,
        "color": color,
        "status": status,
        "brand_id": brandId,
        "is_display": isDisplay,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "mrp": mrp,
      };
}
