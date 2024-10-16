import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/branch/branch_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class BranchRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();
  Future<Either<Failure, BranchModel>> assignedRouteList() async {
    try {
      dynamic response = await getApi(SettingsUrl.branchView);

      if (response != null && response["status"] == true) {
        BranchModel res = BranchModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add

  Future<Either<Failure, ApiModel>> addBranch(
      {required String name, required String stateId}) async {
    try {
      var body = json.encode({"name": name, "state_id": stateId});

      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.branchAdd, isJson: true);

      if (response != null && response["status"] == true) {
        ApiModel res = ApiModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //edit

  Future<Either<Failure, ApiModel>> editBranch({
    required String id,
    required String name,
  }) async {
    try {
      var data = {
        "id": id,
        "name": name,
      };
      dynamic response = await _apiServices.postApi(
        data,
        SettingsUrl.branchEdit,
      );

      if (response != null && response["status"] == true) {
        ApiModel res = ApiModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //delete
  Future<Either<Failure, ApiModel>> deleteBranch({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.branchDelete);

      if (response != null && response["status"] == true) {
        ApiModel res = ApiModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
