// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool? status;
  String? message;
  LoginData? data;

  AuthModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class LoginData {
  int? empId;
  String? token;

  LoginData({
    this.empId,
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        empId: json["emp_id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "token": token,
      };
}

class UserResponse {
  bool? status;
  String? message;
  UserData? data;
  // List<Branch>? branches;
  // List<Privilage>? privilage;

  UserResponse({
    this.status,
    this.message,
    this.data,
    // this.branches,
    // this.privilage,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : UserData.fromJson(json["data"])
      // branches: json["branches"] == null
      //     ? []
      //     : List<Branch>.from(
      //         json["branches"]!.map((x) => Branch.fromJson(x)),
      //       ),
      // privilage: json["privilage"] == null
      // ? []
      // : List<Privilage>.from(
      //     json["privilage"]!.map((x) => Privilage.fromJson(x)),
      //  ),
      );
}

// class Branch {
//   String? id;
//   String? name;
//   String? stateId;
//   String? branchCode;
//   String? statename;

//   Branch({
//     this.id,
//     this.name,
//     this.stateId,
//     this.branchCode,
//     this.statename,
//   });

//   factory Branch.fromJson(Map<String, dynamic> json) => Branch(
//         id: json["id"] == null ? '' : json["id"].toString(),
//         name: json["name"],
//         stateId: json["state_id"] == null ? '' : json["state_id"].toString(),
//         branchCode: json["branch_code"],
//         statename: json["statename"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id ?? '',
//         "name": name ?? '',
//         "state_id": stateId ?? '',
//         "branch_code": branchCode ?? '',
//         "statename": statename ?? '',
//       };
// }

class UserData {
  String? name;
  String? mobile;
  String? email;
  String? location;
  int? roleId;
  int? activeStatus;
  String? joiningDate;
  int? districtId;
  String? address;
  String? code;
  String? stateName;
  String? districtName;

  UserData({
    this.name,
    this.mobile,
    this.email,
    this.location,
    this.roleId,
    this.activeStatus,
    this.joiningDate,
    this.districtId,
    this.address,
    this.code,
    this.stateName,
    this.districtName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        location: json["location"],
        roleId: json["role_id"] ?? 0,
        activeStatus: json["active_status"] ?? 0,
        joiningDate: json["joining_date"],
        districtId: json["district_id"],
        address: json["address"],
        code: json["code"],
        stateName: json["stateName"],
        districtName: json["districtName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "location": location,
        "role_id": roleId,
        "active_status": activeStatus,
        "joining_date": joiningDate,
        "district_id": districtId,
        "address": address,
        "code": code,
        "stateName": stateName,
        "districtName": districtName,
      };
}

// class Privilage {
//   int? id;
//   String? module;
//   String? menu;
//   String? platform;
//   int? privilageId;
//   int? isAdd;
//   int? isDelete;
//   int? isView;
//   int? isEdit;
//   int? userRoleId;

//   Privilage({
//     this.id,
//     this.module,
//     this.menu,
//     this.platform,
//     this.privilageId,
//     this.isAdd,
//     this.isDelete,
//     this.isView,
//     this.isEdit,
//     this.userRoleId,
//   });

//   factory Privilage.fromJson(Map<String, dynamic> json) => Privilage(
//         id: json["id"],
//         module: json["module"],
//         menu: json["menu"],
//         platform: json["platform"],
//         privilageId: json["privilage_id"],
//         isAdd: json["is_add"],
//         isDelete: json["is_delete"],
//         isView: json["is_view"],
//         isEdit: json["is_edit"],
//         userRoleId: json["user_role_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "module": module,
//         "menu": menu,
//         "platform": platform,
//         "privilage_id": privilageId,
//         "is_add": isAdd,
//         "is_delete": isDelete,
//         "is_view": isView,
//         "is_edit": isEdit,
//         "user_role_id": userRoleId,
//       };
// }
