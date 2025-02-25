// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  bool? status;
  String? message;
  List<Place>? data;

  PlaceModel({
    this.status,
    this.message,
    this.data,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Place>.from(json["data"]!.map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Place {
  int? id;
  String? name;
  int? stateId;
  String? district;
  String? state;
  int? districtId;

  Place({
    this.id,
    this.name,
    this.stateId,
    this.district,
    this.state,
    this.districtId,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        district: json["district"],
        state: json["state"],
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "district": district,
        "state": state,
        "district_id": districtId,
      };
}
