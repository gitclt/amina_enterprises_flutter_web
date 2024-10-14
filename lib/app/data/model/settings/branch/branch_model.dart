// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

BranchModel branchModelFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
  bool? status;
  String? message;
  List<Branch>? data;

  BranchModel({
    this.status,
    this.message,
    this.data,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Branch>.from(json["data"]!.map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Branch {
  int? id;
  String? name;
  int? stateId;
  String? branchCode;
   String? state;

  Branch({
    this.id,
    this.name,
    this.stateId,
    this.branchCode,
    this.state,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        branchCode: json["branch_code"],
         state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "branch_code": branchCode,
        "state": state,
      };
}
