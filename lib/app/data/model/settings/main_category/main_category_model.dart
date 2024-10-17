// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);

import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) =>
    MainCategoryModel.fromJson(json.decode(str));

String mainCategoryModelToJson(MainCategoryModel data) =>
    json.encode(data.toJson());

class MainCategoryModel {
  bool? status;
  String? message;
  List<MainCategory>? data;

  MainCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) =>
      MainCategoryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MainCategory>.from(json["data"]!.map((x) => MainCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MainCategory {
  int? id;
  String? name;
  String? image;

  MainCategory({
    this.id,
    this.name,
    this.image,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
