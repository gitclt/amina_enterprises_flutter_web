// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<CustomerData>? data;

  CustomerModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<CustomerData>.from(
                json["data"]!.map((x) => CustomerData.fromJson(x))),
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

class CustomerData {
  int? id;
  String? name;
  String? mobile;
  String? password;
  String? email;
  String? address;
  String? code;
  int? stateId;
  String? state;
  int? districtId;
  String? district;
  String? place;
  String? latitude;
  String? longitude;
  String? customerType;
  int? pincode;
  int? createdEmpId;
  int? creditDays;
  double? targetAmount;
  String? placeId;
  List<DivisionData>? divisions;
  RxBool? isSelect;

  CustomerData(
      {this.id,
      this.name,
      this.mobile,
      this.password,
      this.email,
      this.address,
      this.code,
      this.stateId,
      this.state,
      this.districtId,
      this.district,
      this.place,
      this.latitude,
      this.longitude,
      this.customerType,
      this.pincode,
      this.createdEmpId,
      this.creditDays,
      this.targetAmount,
      this.divisions,
      this.isSelect,
      this.placeId});

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        email: json["email"],
        address: json["address"],
        code: json["code"],
        stateId: json["state_id"],
        state: json["state"],
        districtId: json["district_id"],
        district: json["district"],
        place: json["place"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        customerType: json["customer_type"],
        pincode: json["pincode"],
        createdEmpId: json["created_emp_id"],
        creditDays: json["credit_days"],
        placeId: json["place_id"]?.toString(),
        targetAmount: json["target_amount"]?.toDouble(),
        divisions: json["divisions"] == null
            ? []
            : List<DivisionData>.from(
                json["divisions"]!.map((x) => DivisionData.fromJson(x))),
        isSelect: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "password": password,
        "email": email,
        "address": address,
        "code": code,
        "state_id": stateId,
        "state": state,
        "district_id": districtId,
        "district": district,
        "place": place,
        "place_id": placeId,
        "latitude": latitude,
        "longitude": longitude,
        "customer_type": customerType,
        "pincode": pincode,
        "created_emp_id": createdEmpId,
        "credit_days": creditDays,
        "target_amount": targetAmount,
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
      };
}

class DivisionData {
  int? cusId;
  int? divisionId;
  String? divisionName;
  int? status;

  DivisionData({
    this.cusId,
    this.divisionId,
    this.divisionName,
    this.status,
  });

  factory DivisionData.fromJson(Map<String, dynamic> json) => DivisionData(
        cusId: json["cus_id"],
        divisionId: json["division_id"],
        divisionName: json["division_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "cus_id": cusId,
        "division_id": divisionId,
        "division_name": divisionName,
        "status": status,
      };
}
