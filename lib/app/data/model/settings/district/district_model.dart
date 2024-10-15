// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) =>
    DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  bool? status;
  String? message;
  List<District>? data;

  DistrictModel({
    this.status,
    this.message,
    this.data,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<District>.from(
                json["data"]!.map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class District {
  int? id;
  String? district;
  String? state;
  int? stateId;

  District({
    this.id,
    this.district,
    this.state,
    this.stateId,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        district: json["district"],
        state: json["state"],
        stateId: json["state_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district": district,
        "state": state,
        "state_id": stateId,
      };
}
