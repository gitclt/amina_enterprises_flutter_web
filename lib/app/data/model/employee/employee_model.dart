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
  List<EmployeeData>? data;

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
            : List<EmployeeData>.from(
                json["data"]!.map((x) => EmployeeData.fromJson(x))),
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

class EmployeeData {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? address;
  String? stateId;
  String? state;
  String? location;
  String? roleId;
  String? role;
  String? activeStatus;
  DateTime? joiningDate;
  String? districtId;
  String? district;
  String? designationId;
  String? designation;
  List<EmpDivision>? empDivisions;
  EmployeeData({
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
    this.empDivisions,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        id: json["id"].toString(),
        code: json["code"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        address: json["address"],
        stateId: json["state_id"].toString(),
        state: json["state"],
        location: json["location"],
        roleId: json["role_id"].toString(),
        role: json["role"],
        activeStatus: json["active_status"].toString(),
        joiningDate: json["joining_date"] == null
            ? null
            : DateTime.parse(json["joining_date"]),
        districtId: json["district_id"].toString(),
        district: json["district"],
        designationId: json["designation_id"].toString(),
        designation: json["designation"],
        empDivisions: json["divisions"] == null
            ? []
            : List<EmpDivision>.from(
                json["divisions"]!.map((x) => EmpDivision.fromJson(x))),
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
        "divisions": empDivisions == null
            ? []
            : List<dynamic>.from(empDivisions!.map((x) => x.toJson())),
      };
}

class EmpDivision {
  String? empId;
  String? divisionId;
  String? divisionName;

  EmpDivision({
    this.empId,
    this.divisionId,
    this.divisionName,
  });

  factory EmpDivision.fromJson(Map<String, dynamic> json) => EmpDivision(
        empId: json["emp_id"].toString(),
        divisionId: json["division_id"].toString(),
        divisionName: json["division_name"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "division_id": divisionId,
        "division_name": divisionName,
      };
}
