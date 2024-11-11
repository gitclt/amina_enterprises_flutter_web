// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

class OrderDetailModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPages;
  List<Details>? data;

  OrderDetailModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPages,
    this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<Details>.from(json["data"]!.map((x) => Details.fromJson(x))),
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

class Details {
  int? id;
  String? orderNumber;
  int? itemCount;
  int? customerId;
  String? customer;
  String? date;
  int? districtId;
  String? district;
  dynamic placeId;
  List<Item>? items;
  List<History>? history;

  Details({
    this.id,
    this.orderNumber,
    this.itemCount,
    this.customerId,
    this.customer,
    this.date,
    this.districtId,
    this.district,
    this.placeId,
    this.items,
    this.history,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        orderNumber: json["order_number"],
        itemCount: json["item_count"],
        customerId: json["customer_id"],
        customer: json["customer"],
        date: json["date"],
        districtId: json["district_id"],
        district: json["district"],
        placeId: json["place_id"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        history: json["history"] == null
            ? []
            : List<History>.from(
                json["history"]!.map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "item_count": itemCount,
        "customer_id": customerId,
        "customer": customer,
        "date": date,
        "district_id": districtId,
        "district": district,
        "place_id": placeId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "history": history == null
            ? []
            : List<dynamic>.from(history!.map((x) => x.toJson())),
      };
}

class History {
  dynamic invNo;
  dynamic invDate;
  dynamic invRemark;
  String? status;
  String? remark;
  dynamic statusDate;
  String? mobile;

  History({
    this.invNo,
    this.invDate,
    this.invRemark,
    this.status,
    this.remark,
    this.statusDate,
    this.mobile,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        invNo: json["inv_no"],
        invDate: json["inv_date"],
        invRemark: json["inv_remark"],
        status: json["status"],
        remark: json["remark"],
        statusDate: json["status_date"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "inv_no": invNo,
        "inv_date": invDate,
        "inv_remark": invRemark,
        "status": status,
        "remark": remark,
        "status_date": statusDate,
        "mobile": mobile,
      };
}

class Item {
  int? productId;
  String? productName;
  int? qty;
  int? price;
  String? type;
  String? size;
  String? artNo;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image1Url;
  String? image2Url;
  String? image3Url;
  String? image4Url;

  Item({
    this.productId,
    this.productName,
    this.qty,
    this.price,
    this.type,
    this.size,
    this.artNo,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image1Url,
    this.image2Url,
    this.image3Url,
    this.image4Url,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        productName: json["product_name"],
        qty: json["qty"],
        price: json["price"],
        type: json["type"],
        size: json["size"],
        artNo: json["art_no"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image1Url: json["image1_url"],
        image2Url: json["image2_url"],
        image3Url: json["image3_url"],
        image4Url: json["image4_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "qty": qty,
        "price": price,
        "type": type,
        "size": size,
        "art_no": artNo,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image1_url": image1Url,
        "image2_url": image2Url,
        "image3_url": image3Url,
        "image4_url": image4Url,
      };
}
