// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool? status;
  String? message;
  String? data;

  AuthModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class UserResponse {
  bool? status;
  String? message;
  UserData? data;
  List<Branch>? branches;
  List<Privilage>? privilage;
  
  UserResponse({
    this.status,
    this.message,
    this.data,
    this.branches,
    this.privilage,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x)),
              ),
        privilage: json["privilage"] == null
            ? []
            : List<Privilage>.from(
                json["privilage"]!.map((x) => Privilage.fromJson(x)),
              ),
      );
}

class Branch {
  String? id;
  String? name;
  String? stateId;
  String? branchCode;
  String? statename;

  Branch({
    this.id,
    this.name,
    this.stateId,
    this.branchCode,
    this.statename,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"] == null ? '' : json["id"].toString(),
        name: json["name"],
        stateId: json["state_id"] == null ? '' : json["state_id"].toString(),
        branchCode: json["branch_code"],
        statename: json["statename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "name": name ?? '',
        "state_id": stateId ?? '',
        "branch_code": branchCode ?? '',
        "statename": statename ?? '',
      };
}

class UserData {
  String? employeeId;
  String? employeeName;

  String? rolename;

  String? roleId;

  String? macId;

  UserData({
    this.employeeId,
    this.employeeName,
    this.rolename,
    this.roleId,
    this.macId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        employeeId:
            json["employeeId"] == null ? '' : json["employeeId"].toString(),
        employeeName: json["employeeName"],
        rolename: json["rolename"],
        roleId: json["role_id"] == null ? '' : json["role_id"].toString(),
        macId: json["mac_id"],
      );
}

class Privilage {
  int? id;
  String? module;
  String? menu;
  String? platform;
  int? privilageId;
  int? isAdd;
  int? isDelete;
  int? isView;
  int? isEdit;
  int? userRoleId;

  Privilage({
    this.id,
    this.module,
    this.menu,
    this.platform,
    this.privilageId,
    this.isAdd,
    this.isDelete,
    this.isView,
    this.isEdit,
    this.userRoleId,
  });

  factory Privilage.fromJson(Map<String, dynamic> json) => Privilage(
        id: json["id"],
        module: json["module"],
        menu: json["menu"],
        platform: json["platform"],
        privilageId: json["privilage_id"],
        isAdd: json["is_add"],
        isDelete: json["is_delete"],
        isView: json["is_view"],
        isEdit: json["is_edit"],
        userRoleId: json["user_role_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module": module,
        "menu": menu,
        "platform": platform,
        "privilage_id": privilageId,
        "is_add": isAdd,
        "is_delete": isDelete,
        "is_view": isView,
        "is_edit": isEdit,
        "user_role_id": userRoleId,
      };
}
