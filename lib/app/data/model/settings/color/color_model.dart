// To parse this JSON data, do
//
//     final colorModel = colorModelFromJson(jsonString);

import 'dart:convert';

ColorModel colorModelFromJson(String str) =>
    ColorModel.fromJson(json.decode(str));

String colorModelToJson(ColorModel data) => json.encode(data.toJson());

class ColorModel {
  bool? status;
  String? message;
  List<Color>? data;

  ColorModel({
    this.status,
    this.message,
    this.data,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Color>.from(json["data"]!.map((x) => Color.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Color {
  int? id;
  String? name;

  Color({
    this.id,
    this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
