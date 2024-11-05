import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/route_settings/route_setting_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class RouteSettingRepository  extends NetworkApiServices {
   final _apiServices = NetworkApiServices();

  Future<Either<Failure, RouteSettingModel>> getList() async {
    try {
      dynamic response = await getApi(RouteSettingUrl.routeSettingListApi);

      if (response != null && response["status"] == true) {
        RouteSettingModel res = RouteSettingModel.fromJson(response);

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
  ) async {
    try {
      var data = json.encode({
        "name": name,
      });
      dynamic response = await _apiServices
          .postApi(data, RouteSettingUrl.routeSettingAddApi, isJson: true);

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
  }) async {
    try {
      var data = json.encode({
        "id": id,
        "name": name,
      });
      dynamic response = await _apiServices
          .putApi(data, RouteSettingUrl.routeSettingEditApi, isJson: true);

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
          await _apiServices.deleteApi(body, RouteSettingUrl.routeSettingDeleteApi);

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