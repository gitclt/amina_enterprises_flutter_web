// To parse this JSON data, do
//
//     final employeeListModel = employeeListModelFromJson(jsonString);

import 'dart:convert';

EmployeeListModel employeeListModelFromJson(String str) =>
    EmployeeListModel.fromJson(json.decode(str));

String employeeListModelToJson(EmployeeListModel data) =>
    json.encode(data.toJson());

class EmployeeListModel {
  bool? status;
  String? message;
  List<EmployeeData>? data;

  EmployeeListModel({
    this.status,
    this.message,
    this.data,
  });

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<EmployeeData>.from(
                json["data"]!.map((x) => EmployeeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EmployeeData {
  int? id;
  String? name;
  String? code;
  String? password;
  String? mobile;
  String? email;
  String? state;
  String? location;
  int? designationId;
  String? dob;
  String? doj;
  String? address;
  int? businessheadId;
  int? zsmId;
  int? salescordinatorId;
  int? roleId;
  String? branchId;
  int? isBdm;
  String? designationName;
  String? roleName;
  List<Branch>? branches;
  String? macId;

  EmployeeData({
    this.id,
    this.name,
    this.code,
    this.password,
    this.mobile,
    this.email,
    this.state,
    this.location,
    this.designationId,
    this.dob,
    this.doj,
    this.address,
    this.businessheadId,
    this.zsmId,
    this.salescordinatorId,
    this.roleId,
    this.branchId,
    this.isBdm,
    this.designationName,
    this.roleName,
    this.branches,
    this.macId,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        code: json["code"] ?? '',
        password: json["password"] ?? '',
        mobile: json["mobile"] ?? '',
        email: json["email"] ?? '',
        state: json["state"] ?? '',
        location: json["location"] ?? '',
        designationId: json["designation_id"] ?? 0,
        dob: json["dob"] ?? '',
        doj: json["doj"] ?? '',
        address: json["address"] ?? '',
        businessheadId: json["businesshead_id"] ?? 0,
        zsmId: json["zsm_id"] ?? 0,
        salescordinatorId: json["salescordinator_id"] ?? 0,
        roleId: json["role_id"] ?? 0,
        branchId: json["branch_id"] ?? '',
        isBdm: json["isBdm"] ?? 0,
        designationName: json["desgnation"] ?? '',
        roleName: json["rolename"] ?? '',
        macId: json["mac_id"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "password": password,
        "mobile": mobile,
        "email": email,
        "state": state,
        "location": location,
        "designation_id": designationId,
        "dob": dob,
        "doj": doj,
        "address": address,
        "businesshead_id": businessheadId,
        "zsm_id": zsmId,
        "salescordinator_id": salescordinatorId,
        "role_id": roleId,
        "branch_id": branchId,
        "isBdm": isBdm,
        "desgnation": designationName,
        "role_name": roleName,
        "mac_id": macId,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
      };
}

class Branch {
  int? id;
  String? name;

  Branch({
    this.id,
    this.name,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
