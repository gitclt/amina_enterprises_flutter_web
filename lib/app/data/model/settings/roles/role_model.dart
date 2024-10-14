// To parse this JSON data, do
//
//     final roleModel = roleModelFromJson(jsonString);

import 'dart:convert';

RoleModel roleModelFromJson(String str) => RoleModel.fromJson(json.decode(str));

String roleModelToJson(RoleModel data) => json.encode(data.toJson());

class RoleModel {
    bool? status;
    String? message;
    List<RoleListData>? data;

    RoleModel({
        this.status,
        this.message,
        this.data,
    });

    factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<RoleListData>.from(json["data"]!.map((x) => RoleListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RoleListData {
    int? id;
    String? name;
    int? order;

    RoleListData({
        this.id,
        this.name,
        this.order,
    });

    factory RoleListData.fromJson(Map<String, dynamic> json) => RoleListData(
        id: json["id"],
        name: json["name"],
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order,
    };
}
