// To parse this JSON data, do
//
//     final productitemAddModel = productitemAddModelFromJson(jsonString);

import 'dart:convert';

List<ProductitemAddModel> productitemAddModelFromJson(String str) =>
    List<ProductitemAddModel>.from(
        json.decode(str).map((x) => ProductitemAddModel.fromJson(x)));

String productitemAddModelToJson(List<ProductitemAddModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductitemAddModel {
  int? proId;
  int? colorId;
  int? size;
  int? subCatId;
  int? mrp;
  String? status;
  int? isDisplay;
  int? stateId;
  int? stock;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  int? addedBy;

  ProductitemAddModel({
    this.proId,
    this.colorId,
    this.size,
    this.subCatId,
    this.mrp,
    this.status,
    this.isDisplay,
    this.stateId,
    this.stock,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.addedBy,
  });

  factory ProductitemAddModel.fromJson(Map<String, dynamic> json) =>
      ProductitemAddModel(
        proId: json["pro_id"],
        colorId: json["color_id"],
        size: json["size"],
        subCatId: json["sub_cat_id"],
        mrp: json["mrp"],
        status: json["status"],
        isDisplay: json["is_display"],
        stateId: json["state_id"],
        stock: json["stock"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        addedBy: json["added_by"],
      );

  Map<String, dynamic> toJson() => {
        "pro_id": proId,
        "color_id": colorId,
        "size": size,
        "sub_cat_id": subCatId,
        "mrp": mrp,
        "status": status,
        "is_display": isDisplay,
        "state_id": stateId,
        "stock": stock,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "added_by": addedBy,
      };
}
