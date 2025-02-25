// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<Order>? data;

  OrderModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<Order>.from(json["data"]!.map((x) => Order.fromJson(x))),
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

class Order {
  int? id;
  int? empId;
  String? orderNumber;
  String? invNo;
  String? invDate;
  String? invRemark;
  int? itemCount;
  String? date;
  int? customerId;
  String? customer;
  int? districtId;
  dynamic place;
  String? district;
  String? status;

  Order({
    this.id,
    this.empId,
    this.orderNumber,
    this.invNo,
    this.invDate,
    this.invRemark,
    this.itemCount,
    this.date,
    this.customerId,
    this.customer,
    this.districtId,
    this.place,
    this.district,
    this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        empId: json["emp_id"],
        orderNumber: json["order_number"],
        invNo: json["inv_no"],
        invDate: json["inv_date"],
        invRemark: json["inv_remark"],
        itemCount: json["item_count"],
        date: json["date"],
        customerId: json["customer_id"],
        customer: json["customer"],
        districtId: json["district_id"],
        place: json["place"],
        district: json["district"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "emp_id": empId,
        "order_number": orderNumber,
        "inv_no": invNo,
        "inv_date": invDate,
        "inv_remark": invRemark,
        "item_count": itemCount,
        "date": date,
        "customer_id": customerId,
        "customer": customer,
        "district_id": districtId,
        "place": place,
        "district": district,
        "status": status,
      };
}
