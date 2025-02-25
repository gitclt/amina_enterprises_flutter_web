// To parse this JSON data, do
//
//     final routeModel = routeModelFromJson(jsonString);

import 'dart:convert';

RouteModel routeModelFromJson(String str) =>
    RouteModel.fromJson(json.decode(str));

String routeModelToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
  bool? status;
  String? message;
  List<RouteData>? data;

  RouteModel({
    this.status,
    this.message,
    this.data,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RouteData>.from(json["data"]!.map((x) => RouteData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RouteData {
  int? id;
  String? name;

  RouteData({
    this.id,
    this.name,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
