// // To parse this JSON data, do
// //
// //     final placeModel = placeModelFromJson(jsonString);

// import 'dart:convert';

// PlaceModel placeModelFromJson(String str) =>
//     PlaceModel.fromJson(json.decode(str));

// String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

// class PlaceModel {
//   bool? status;
//   String? message;
//   List<PlaceListData>? data;

//   PlaceModel({
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<PlaceListData>.from(json["data"]!.map((x) => PlaceListData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class PlaceListData {
//   int? locId;
//   String? locationName;
//   int? stateId;
//   String? state;

//   PlaceListData({
//     this.locId,
//     this.locationName,
//     this.stateId,
//     this.state,
//   });

//   factory PlaceListData.fromJson(Map<String, dynamic> json) => PlaceListData(
//         locId: json["loc_id"],
//         locationName: json["location_name"],
//         stateId: json["state_id"],
//         state: json["state"],
//       );

//   Map<String, dynamic> toJson() => {
//         "loc_id": locId,
//         "location_name": locationName,
//         "state_id": stateId,
//         "state": state,
//       };
// }

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
  List<PlaceListData>? data;

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
            : List<PlaceListData>.from(json["data"]!.map((x) => PlaceListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PlaceListData {
  int? id;
  String? name;
  int? stateId;
  String? state;

  PlaceListData({
    this.id,
    this.name,
    this.stateId,
    this.state,
  });

  factory PlaceListData.fromJson(Map<String, dynamic> json) => PlaceListData(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "state": state,
      };
}
