// To parse this JSON data, do
//
//     final subGroupListModel = subGroupListModelFromJson(jsonString);

import 'dart:convert';

SubGroupListModel subGroupListModelFromJson(String str) =>
    SubGroupListModel.fromJson(json.decode(str));

String subGroupListModelToJson(SubGroupListModel data) =>
    json.encode(data.toJson());

class SubGroupListModel {
  bool? status;
  String? message;
  List<SubGroupData>? data;

  SubGroupListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SubGroupListModel.fromJson(Map<String, dynamic> json) =>
      SubGroupListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubGroupData>.from(json["data"]!.map((x) => SubGroupData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubGroupData {
  String? groupname;
  int? groupId;
  int? subgroupId;
  String? subgroup;

  SubGroupData({
    this.groupname,
    this.groupId,
    this.subgroupId,
    this.subgroup,
  });

  factory SubGroupData.fromJson(Map<String, dynamic> json) => SubGroupData(
        groupname: json["groupname"],
        groupId: json["group_id"],
        subgroupId: json["subgroup_id"],
        subgroup: json["subgroup"],
      );

  Map<String, dynamic> toJson() => {
        "groupname": groupname,
        "group_id": groupId,
        "subgroup_id": subgroupId,
        "subgroup": subgroup,
      };
}
