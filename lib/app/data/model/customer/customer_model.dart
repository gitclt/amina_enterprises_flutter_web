// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  bool? status;
  String? message;
  List<Customer>? data;
  int? totalCount;
  int? totalPages;

  CustomerModel({
    this.status,
    this.message,
    this.data,
    this.totalCount,
    this.totalPages,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Customer>.from(json["data"]!.map((x) => Customer.fromJson(x))),
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalCount": totalCount,
        "totalPages": totalPages,
      };
}

class Customer {
  int? id;
  String? district;
  String? state;
  String? name;
  String? customerType;
  String? code;
  String? password;
  String? email;
  String? mobile;
  String? address;
  String? place;
  int? stateId;
  int? districtId;
  String? latitude;
  String? longitude;
  String? gpsLocation;
  int? createdEmpId;
  String? status;
  int? addedby;

  Customer({
    this.id,
    this.district,
    this.state,
    this.name,
    this.customerType,
    this.code,
    this.password,
    this.email,
    this.mobile,
    this.address,
    this.place,
    this.stateId,
    this.districtId,
    this.latitude,
    this.longitude,
    this.gpsLocation,
    this.createdEmpId,
    this.status,
    this.addedby,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        district: json["district"],
        state: json["state"],
        name: json["name"],
        customerType: json["customer_type"],
        code: json["code"],
        password: json["password"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        place: json["place"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        gpsLocation: json["gps_location"],
        createdEmpId: json["created_emp_id"],
        status: json["status"],
        addedby: json["addedby"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district": district,
        "state": state,
        "name": name,
        "customer_type": customerType,
        "code": code,
        "password": password,
        "email": email,
        "mobile": mobile,
        "address": address,
        "place": place,
        "state_id": stateId,
        "district_id": districtId,
        "latitude": latitude,
        "longitude": longitude,
        "gps_location": gpsLocation,
        "created_emp_id": createdEmpId,
        "status": status,
        "addedby": addedby,
      };
}
