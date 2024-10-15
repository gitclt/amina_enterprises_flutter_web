// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<Employee>? data;

  EmployeeModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<Employee>.from(
                json["data"]!.map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalCount": totalCount,
        "totalPages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Employee {
  int? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? address;
  int? stateId;
  String? state;
  String? location;
  int? roleId;
  String? role;
  int? activeStatus;
  DateTime? joiningDate;
  int? districtId;
  String? district;
  int? designationId;
  String? designation;

  Employee({
    this.id,
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.address,
    this.stateId,
    this.state,
    this.location,
    this.roleId,
    this.role,
    this.activeStatus,
    this.joiningDate,
    this.districtId,
    this.district,
    this.designationId,
    this.designation,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        address: json["address"],
        stateId: json["state_id"],
        state: json["state"],
        location: json["location"],
        roleId: json["role_id"],
        role: json["role"],
        activeStatus: json["active_status"],
        joiningDate: json["joining_date"] == null
            ? null
            : DateTime.parse(json["joining_date"]),
        districtId: json["district_id"],
        district: json["district"],
        designationId: json["designation_id"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "address": address,
        "state_id": stateId,
        "state": state,
        "location": location,
        "role_id": roleId,
        "role": role,
        "active_status": activeStatus,
        "joining_date": joiningDate?.toIso8601String(),
        "district_id": districtId,
        "district": district,
        "designation_id": designationId,
        "designation": designation,
      };
}
