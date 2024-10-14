import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/add_role_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/role_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/role_privilage_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/user_role_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class SettingsRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, RoleModel>> getRoleList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.roleListApi,
      );

      if (response != null && response["status"] == true) {
        RoleModel res = RoleModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserRoleModel>> getUserRoleList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.userRoleListApi,
      );

      if (response != null && response["status"] == true) {
        UserRoleModel res = UserRoleModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserRoleModel>> roleDelete(
      {required String id}) async {
    var data = {"Id": id};

    try {
      dynamic response =
          await _apiServices.postApi(data, SettingsUrl.roleDeleteApi);

      if (response != null && response["status"] == true) {
        UserRoleModel res = UserRoleModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, RoleModel>> roleAdd(
      {required String roleName, required String roleId}) async {
    var data = {"user_role_name": roleName, "role_id": roleId};

    try {
      dynamic response =
          await _apiServices.postApi(data, SettingsUrl.roleAddApi);

      if (response != null && response["status"] == true) {
        RoleModel res = RoleModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserRoleModel>> roleUpdate(
      {required String roleName,
      required String roleId,
      required String id}) async {
    var data = {"user_role_name": roleName, "role_id": roleId, "id": id};

    try {
      dynamic response =
          await _apiServices.postApi(data, SettingsUrl.roleUpdateApi);

      if (response != null && response["status"] == true) {
        UserRoleModel res = UserRoleModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, RolePrivilageModel>> rolePrivilageList(
      {required String roleId}) async {
    try {
      dynamic response = await _apiServices
          .getApi("${SettingsUrl.rolePrivilageApi}?role_id=$roleId");

      if (response != null && response["status"] == true) {
        RolePrivilageModel res = RolePrivilageModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, RolePrivilageModel>> rolePrivilageAdd(
      {List<AddRoleModel>? data}) async {
    final body = json.encode(data);
    try {
      dynamic response = await _apiServices
          .postApi(body, SettingsUrl.rolePrivilageAddApi, isJson: true);

      if (response != null && response["status"] == true) {
        RolePrivilageModel res = RolePrivilageModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, RolePrivilageModel>> rolePrivilageUpdate(
      {List<AddRoleModel>? data}) async {
    final body = json.encode(data);
    try {
      dynamic response = await _apiServices
          .postApi(body, SettingsUrl.rolePrivilageUpdateApi, isJson: true);

      if (response != null && response["status"] == true) {
        RolePrivilageModel res = RolePrivilageModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
