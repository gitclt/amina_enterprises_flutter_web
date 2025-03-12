// To parse this JSON data, do
//
//     final customerAddModel = customerAddModelFromJson(jsonString);

import 'dart:convert';

CustomerAddModel customerAddModelFromJson(String str) =>
    CustomerAddModel.fromJson(json.decode(str));

String customerAddModelToJson(CustomerAddModel data) =>
    json.encode(data.toJson());

class CustomerAddModel {
  Customer? customer;
  List<Division>? divisions;

  CustomerAddModel({
    this.customer,
    this.divisions,
  });

  factory CustomerAddModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddModel(
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        divisions: json["divisions"] == null
            ? []
            : List<Division>.from(
                json["divisions"]!.map((x) => Division.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer?.toJson(),
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
      };
}

class Customer {
  String? id;
  String? name;
  String? customerType;
  String? code;
  String? password;
  String? email;
  String? mobile;
  String? address;
  String? placeId;
  int? stateId;
  int? districtId;
  String? latitude;
  String? longitude;
  String? gpsLocation;
  int? createdEmpId;
  int? addedby;
  int? pincode;
  int? creditDays;
  int? target;

  Customer({
    this.id,
    this.name,
    this.customerType,
    this.code,
    this.password,
    this.email,
    this.mobile,
    this.address,
    this.placeId,
    this.stateId,
    this.districtId,
    this.latitude,
    this.longitude,
    this.gpsLocation,
    this.createdEmpId,
    this.addedby,
    this.pincode,
    this.creditDays,
    this.target,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        customerType: json["customer_type"],
        code: json["code"],
        password: json["password"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        placeId: json["place_id"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        gpsLocation: json["gps_location"],
        createdEmpId: json["created_emp_id"],
        addedby: json["addedby"],
        pincode: json["pincode"],
        creditDays: json["credit_days"],
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        if (name != null) "name": name,
        if (customerType != null) "customer_type": customerType,
        if (code != null) "code": code,
        if (password != null) "password": password,
        if (email != null) "email": email,
        if (mobile != null) "mobile": mobile,
        if (address != null) "address": address,
        if (placeId != null) "place_id": placeId,
        if (stateId != null) "state_id": stateId,
        if (districtId != null) "district_id": districtId,
        if (latitude != null) "latitude": latitude,
        if (longitude != null) "longitude": longitude,
        if (gpsLocation != null) "gps_location": gpsLocation,
        if (createdEmpId != null) "created_emp_id": createdEmpId,
        if (addedby != null) "addedby": addedby,
        if (pincode != null) "pincode": pincode,
        if (creditDays != null) "credit_days": creditDays,
        if (target != null) "target": target,
      };
}

class Division {
  int? divisionId;
  // int? createdEmpId;

  Division({
    this.divisionId,
    // this.createdEmpId,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        divisionId: json["division_id"],
        // createdEmpId: json["created_emp_id"],
      );

  Map<String, dynamic> toJson() => {
        "division_id": divisionId,
        // "created_emp_id": createdEmpId,
      };
}
