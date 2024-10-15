// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  bool? status;
  String? message;
  List<StateData>? data;

  StateModel({
    this.status,
    this.message,
    this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StateData>.from(json["data"]!.map((x) => StateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StateData {
  int? id;
  String? name;

  StateData({
    this.id,
    this.name,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
