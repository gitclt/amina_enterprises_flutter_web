// To parse this JSON data, do
//
//     final UserRoleModel = UserRoleModelFromJson(jsonString);

import 'dart:convert';

UserRoleModel userRoleModelFromJson(String str) => UserRoleModel.fromJson(json.decode(str));

String userRoleModelToJson(UserRoleModel data) => json.encode(data.toJson());

class UserRoleModel {
    bool? status;
    List<RoleData>? data;

    UserRoleModel({
        this.status,
        this.data,
    });

    factory UserRoleModel.fromJson(Map<String, dynamic> json) => UserRoleModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<RoleData>.from(json["data"]!.map((x) => RoleData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RoleData {
    int? id;
    String? userRoleName;
    int? roleId;
    int? deleteStatus;

    RoleData({
        this.id,
        this.userRoleName,
        this.roleId,
        this.deleteStatus,
    });

    factory RoleData.fromJson(Map<String, dynamic> json) => RoleData(
        id: json["id"],
        userRoleName: json["user_role_name"],
        roleId: json["role_id"],
        deleteStatus: json["delete_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_role_name": userRoleName,
        "role_id": roleId,
        "delete_status": deleteStatus,
    };
}
