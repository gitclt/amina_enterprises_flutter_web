// // To parse this JSON data, do
// //
// //     final routeSettingModel = routeSettingModelFromJson(jsonString);

// import 'dart:convert';

// RouteSettingModel routeSettingModelFromJson(String str) =>
//     RouteSettingModel.fromJson(json.decode(str));

// String routeSettingModelToJson(RouteSettingModel data) =>
//     json.encode(data.toJson());

// class RouteSettingModel {
//   bool? status;
//   List<RouteSetting>? data;

//   RouteSettingModel({
//     this.status,
//     this.data,
//   });

//   factory RouteSettingModel.fromJson(Map<String, dynamic> json) =>
//       RouteSettingModel(
//         status: json["status"],
//         data: json["data"] == null
//             ? []
//             : List<RouteSetting>.from(json["data"]!.map((x) => RouteSetting.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class RouteSetting {
//   int? rootId;
//   String? rootName;
//   int? customerCount;

//   RouteSetting({
//     this.rootId,
//     this.rootName,
//     this.customerCount,
//   });

//   factory RouteSetting.fromJson(Map<String, dynamic> json) => RouteSetting(
//         rootId: json["root_id"],
//         rootName: json["root_name"],
//         customerCount: json["customer_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "root_id": rootId,
//         "root_name": rootName,
//         "customer_count": customerCount,
//       };
// }

// To parse this JSON data, do
//
//     final routeSettingModel = routeSettingModelFromJson(jsonString);

import 'dart:convert';

RouteSettingModel routeSettingModelFromJson(String str) =>
    RouteSettingModel.fromJson(json.decode(str));

String routeSettingModelToJson(RouteSettingModel data) =>
    json.encode(data.toJson());

class RouteSettingModel {
  bool? status;
  List<RouteSetting>? data;

  RouteSettingModel({
    this.status,
    this.data,
  });

  factory RouteSettingModel.fromJson(Map<String, dynamic> json) =>
      RouteSettingModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<RouteSetting>.from(json["data"]!.map((x) => RouteSetting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RouteSetting {
  int? rootId;
  String? rootName;
  int? customerCount;
  List<Customer>? customers;

  RouteSetting({
    this.rootId,
    this.rootName,
    this.customerCount,
    this.customers,
  });

  factory RouteSetting.fromJson(Map<String, dynamic> json) => RouteSetting(
        rootId: json["root_id"],
        rootName: json["root_name"],
        customerCount: json["customer_count"],
        customers: json["customers"] == null
            ? []
            : List<Customer>.from(
                json["customers"]!.map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "root_id": rootId,
        "root_name": rootName,
        "customer_count": customerCount,
        "customers": customers == null
            ? []
            : List<dynamic>.from(customers!.map((x) => x.toJson())),
      };
}

class Customer {
  int? customerId;
  String? customerName;
  String? customerType;
  String? address;
  int? placeId;
  String? place;
  int? stateId;
  int? districtId;

  Customer({
    this.customerId,
    this.customerName,
    this.customerType,
    this.address,
    this.placeId,
    this.place,
    this.stateId,
    this.districtId,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerType: json["customer_type"],
        address: json["address"],
        placeId: json["place_id"],
        place: json["place"],
        stateId: json["state_id"],
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_type": customerType,
        "address": address,
        "place_id": placeId,
        "place": place,
        "state_id": stateId,
        "district_id": districtId,
      };
}
