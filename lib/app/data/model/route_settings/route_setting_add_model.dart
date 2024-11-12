// To parse this JSON data, do
//
//     final routeAddModel = routeAddModelFromJson(jsonString);

import 'dart:convert';

List<RouteAddModel> routeAddModelFromJson(String str) =>
    List<RouteAddModel>.from(
        json.decode(str).map((x) => RouteAddModel.fromJson(x)));

String routeAddModelToJson(List<RouteAddModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteAddModel {
  int? customerId;
  int? rootId;

  RouteAddModel({
    this.customerId,
    this.rootId,
  });

  factory RouteAddModel.fromJson(Map<String, dynamic> json) => RouteAddModel(
        customerId: json["customer_id"],
        rootId: json["root_id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "root_id": rootId,
      };
}
