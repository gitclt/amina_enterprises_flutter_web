// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  bool? status;
  String? message;
  List<Brand>? data;

  BrandModel({
    this.status,
    this.message,
    this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Brand>.from(json["data"]!.map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Brand {
  int? id;
  String? name;
  String? image;
  String? imageurl;

  Brand({
    this.id,
    this.name,
    this.image,
    this.imageurl,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "imageurl": imageurl,
      };
}
