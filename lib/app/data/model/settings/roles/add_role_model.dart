// To parse this JSON data, do
//
//     final addRoleModel = addRoleModelFromJson(jsonString);

import 'dart:convert';

List<AddRoleModel> addRoleModelFromJson(String str) => List<AddRoleModel>.from(
    json.decode(str).map((x) => AddRoleModel.fromJson(x)));

String addRoleModelToJson(List<AddRoleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddRoleModel {
  String? privilageId;
  int? isAdd;
  int? isDelete;
  int? isView;
  int? isEdit;
  String? userRoleId;
  int? id;

  AddRoleModel(
      {this.privilageId,
      this.isAdd,
      this.isDelete,
      this.isView,
      this.isEdit,
      this.userRoleId,
      this.id});

  factory AddRoleModel.fromJson(Map<String, dynamic> json) => AddRoleModel(
      privilageId: json["privilage_id"],
      isAdd: json["is_add"],
      isDelete: json["is_delete"],
      isView: json["is_view"],
      isEdit: json["is_edit"],
      userRoleId: json["user_role_id"],
      id: json["id"] ?? 0);

  Map<String, dynamic> toJson() => {
        "privilage_id": privilageId,
        "is_add": isAdd,
        "is_delete": isDelete,
        "is_view": isView,
        "is_edit": isEdit,
        "user_role_id": userRoleId,
        if (id != null) "id": id
      };
}
