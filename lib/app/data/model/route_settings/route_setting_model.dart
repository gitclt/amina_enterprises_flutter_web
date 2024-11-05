// To parse this JSON data, do
//
//     final routeSettingModel = routeSettingModelFromJson(jsonString);

import 'dart:convert';

RouteSettingModel routeSettingModelFromJson(String str) =>
    RouteSettingModel.fromJson(json.decode(str));

String routeSettingModelToJson(RouteSettingModel data) =>
    json.encode(data.toJson());

class RouteSettingModel {
  bool? status;
  String? message;
  List<RouteSetting>? data;

  RouteSettingModel({
    this.status,
    this.message,
    this.data,
  });

  factory RouteSettingModel.fromJson(Map<String, dynamic> json) =>
      RouteSettingModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RouteSetting>.from(json["data"]!.map((x) => RouteSetting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RouteSetting {
  int? id;
  String? name;

  RouteSetting({
    this.id,
    this.name,
  });

  factory RouteSetting.fromJson(Map<String, dynamic> json) => RouteSetting(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
