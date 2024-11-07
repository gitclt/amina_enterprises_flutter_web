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
  List<RouteSetting>? data;

  RouteSettingModel({
    this.status,
    this.data,
  });

  factory RouteSettingModel.fromJson(Map<String, dynamic> json) =>
      RouteSettingModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<RouteSetting>.from(json["data"]!.map((x) => RouteSetting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RouteSetting {
  int? rootId;
  String? rootName;
  int? customerCount;

  RouteSetting({
    this.rootId,
    this.rootName,
    this.customerCount,
  });

  factory RouteSetting.fromJson(Map<String, dynamic> json) => RouteSetting(
        rootId: json["root_id"],
        rootName: json["root_name"],
        customerCount: json["customer_count"],
      );

  Map<String, dynamic> toJson() => {
        "root_id": rootId,
        "root_name": rootName,
        "customer_count": customerCount,
      };
}
