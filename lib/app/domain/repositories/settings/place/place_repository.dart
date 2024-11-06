import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/district/district_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class PlaceRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, DistrictModel>> getList({
    String? stateId,
  }) async {
    try {
      dynamic response = await getApi(SettingsUrl.placeListApi);

      if (response != null && response["status"] == true) {
        DistrictModel res = DistrictModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

//add
  Future<Either<Failure, ApiModel>> add(
    String name,
    String stateId,
    String districtId
  ) async {
    try {
      var data = json.encode({
        "name": name,
        "state_id": stateId,
        
        "district_id": districtId
      });
      dynamic response = await _apiServices
          .postApi(data, SettingsUrl.placeAddApi, isJson: true);

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

  Future<Either<Failure, ApiModel>> edit({
    required String id,
    required String name,
    required String stateId,
        String? districtId
  }) async {
    try {
      var data = json.encode({
        "id": id,
        "name": name,
        "state_id": stateId,
          "district_id": districtId
      });
      dynamic response = await _apiServices
          .putApi(data, SettingsUrl.placeEditApi, isJson: true);

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
  Future<Either<Failure, ApiModel>> delete({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.placeDeleteApi);

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
