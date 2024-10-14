// To parse this JSON data, do
//
//     final designationListModel = designationListModelFromJson(jsonString);

import 'dart:convert';

DesignationListModel designationListModelFromJson(String str) =>
    DesignationListModel.fromJson(json.decode(str));

String designationListModelToJson(DesignationListModel data) =>
    json.encode(data.toJson());

class DesignationListModel {
  bool? status;
  String? message;
  List<DesignationData>? data;

  DesignationListModel({
    this.status,
    this.message,
    this.data,
  });

  factory DesignationListModel.fromJson(Map<String, dynamic> json) =>
      DesignationListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DesignationData>.from(
                json["data"]!.map((x) => DesignationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DesignationData {
  int? id;
  String? name;

  DesignationData({
    this.id,
    this.name,
  });

  factory DesignationData.fromJson(Map<String, dynamic> json) =>
      DesignationData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
