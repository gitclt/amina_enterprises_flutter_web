// To parse this JSON data, do
//
//     final empResponseModel = empResponseModelFromJson(jsonString);

import 'dart:convert';

EmpResponseModel empResponseModelFromJson(String str) => EmpResponseModel.fromJson(json.decode(str));

String empResponseModelToJson(EmpResponseModel data) => json.encode(data.toJson());

class EmpResponseModel {
    bool? status;
    String? message;
    Data? data;

    EmpResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory EmpResponseModel.fromJson(Map<String, dynamic> json) => EmpResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    dynamic code;
    String? password;
    String? mobile;
    String? email;
    String? state;
    String? location;
    int? designationId;
    DateTime? dob;
    DateTime? doj;
    String? address;
    dynamic businessheadId;
    dynamic zsmId;
    dynamic salescordinatorId;
    String? addedon;
    int? activestatus;
    int? roleId;
    int? blockStatus;
    String? branchId;
    String? lastLogin;
    dynamic appVersion;
    int? deleteStatus;
    dynamic deletedOn;
    dynamic deletedBy;
    dynamic deletedType;
    dynamic fcm;
    dynamic macId;
    String? token;
    String? tokenDate;
    dynamic isBdm;

    Data({
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
        this.addedon,
        this.activestatus,
        this.roleId,
        this.blockStatus,
        this.branchId,
        this.lastLogin,
        this.appVersion,
        this.deleteStatus,
        this.deletedOn,
        this.deletedBy,
        this.deletedType,
        this.fcm,
        this.macId,
        this.token,
        this.tokenDate,
        this.isBdm,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        password: json["password"],
        mobile: json["mobile"],
        email: json["email"],
        state: json["state"],
        location: json["location"],
        designationId: json["designation_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
        address: json["address"],
        businessheadId: json["businesshead_id"],
        zsmId: json["zsm_id"],
        salescordinatorId: json["salescordinator_id"],
        addedon: json["addedon"],
        activestatus: json["activestatus"],
        roleId: json["role_id"],
        blockStatus: json["block_status"],
        branchId: json["branch_id"],
        lastLogin: json["last_login"],
        appVersion: json["app_version"],
        deleteStatus: json["delete_status"],
        deletedOn: json["deleted_on"],
        deletedBy: json["deleted_by"],
        deletedType: json["deleted_type"],
        fcm: json["fcm"],
        macId: json["mac_id"],
        token: json["token"],
        tokenDate: json["token_date"],
        isBdm: json["isBdm"],
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
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "doj": "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "address": address,
        "businesshead_id": businessheadId,
        "zsm_id": zsmId,
        "salescordinator_id": salescordinatorId,
        "addedon": addedon,
        "activestatus": activestatus,
        "role_id": roleId,
        "block_status": blockStatus,
        "branch_id": branchId,
        "last_login": lastLogin,
        "app_version": appVersion,
        "delete_status": deleteStatus,
        "deleted_on": deletedOn,
        "deleted_by": deletedBy,
        "deleted_type": deletedType,
        "fcm": fcm,
        "mac_id": macId,
        "token": token,
        "token_date": tokenDate,
        "isBdm": isBdm,
    };
}
