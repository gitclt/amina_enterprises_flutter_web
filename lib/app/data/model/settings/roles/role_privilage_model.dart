// To parse this JSON data, do
//
//     final rolePrivilageModel = rolePrivilageModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

RolePrivilageModel rolePrivilageModelFromJson(String str) =>
    RolePrivilageModel.fromJson(json.decode(str));

String rolePrivilageModelToJson(RolePrivilageModel data) =>
    json.encode(data.toJson());

class RolePrivilageModel {
  bool? status;
  String? message;
  List<Privilage>? privilage;

  RolePrivilageModel({
    this.status,
    this.message,
    this.privilage,
  });

  factory RolePrivilageModel.fromJson(Map<String, dynamic> json) =>
      RolePrivilageModel(
        status: json["status"],
        message: json["message"],
        privilage: json["privilage"] == null
            ? []
            : List<Privilage>.from(
                json["privilage"]!.map((x) => Privilage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "privilage": privilage == null
            ? []
            : List<dynamic>.from(privilage!.map((x) => x.toJson())),
      };
}

class Privilage {
  int? id;
  String? module;
  String? menu;
  RxInt isAdd;
  RxInt isView;
  RxInt isEdit;
  RxInt isDelete;
  int? privilageId;

  Privilage({
    this.id,
    this.module,
    this.menu,
    required this.isAdd,
    required this.isView,
    required this.isEdit,
    required this.isDelete,
    this.privilageId,
  });

  factory Privilage.fromJson(Map<String, dynamic> json) => Privilage(
        id: json["id"],
        module: json["module"],
        menu: json["menu"],
        isAdd: json["is_add"] == 0 ? 0.obs : 1.obs,
        isView: json["is_view"] == 0 ? 0.obs : 1.obs,
        isEdit: json["is_edit"] == 0 ? 0.obs : 1.obs,
        isDelete: json["is_delete"] == 0 ? 0.obs : 1.obs,
        privilageId: json["privilage_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module": module,
        "menu": menu,
        "is_add": isAdd,
        "is_delete": isDelete,
        "is_view": isView,
        "is_edit": isEdit,
        "privilage_id": privilageId,
      };
}
