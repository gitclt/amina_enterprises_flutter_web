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
  List<State>? data;

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
            : List<State>.from(json["data"]!.map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class State {
  int? id;
  String? name;

  State({
    this.id,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
