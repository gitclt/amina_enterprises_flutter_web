import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/route_settings/route_setting_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_add_response_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class RouteSettingRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, RouteSettingModel>> getList({String? rootid}) async {
    try {
      dynamic response = await getApi('${RouteSettingUrl.routeSettingListApi}?root_id=$rootid');

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
  Future<Either<Failure, ApiModel>> addRoute({
    List<RouteAddModel>? data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response = await _apiServices
          .postApi(body, RouteSettingUrl.routeSettingAddApi, isJson: true);

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

  
//updateroute
  Future<Either<Failure, ApiModel>> updateRoute({
    List<RouteAddModel>? data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response = await _apiServices
          .putApi(body, RouteSettingUrl.routeSettingUpdateApi, isJson: true);

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

  Future<Either<Failure, ApiModel>> editRouteName({
    required String id,
    required String name,
  }) async {
    try {
      var data = json.encode({
        "id": id,
        "name": name,
      });
      dynamic response = await _apiServices
          .putApi(data, RouteSettingUrl.routeNameEditApi, isJson: true);

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
    var body = {"root_id": id};
    try {
      dynamic response = await _apiServices.deleteApi(
          body, RouteSettingUrl.routeSettingDeleteApi);

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

  //addname
  Future<Either<Failure, ProAddresponseModel>> addRouteName(
    String name,
  ) async {
    try {
      var data = json.encode({
        "name": name,
      });
      dynamic response = await _apiServices
          .postApi(data, RouteSettingUrl.routeNameAddApi, isJson: true);

      if (response != null && response["status"] == true) {
        ProAddresponseModel res = ProAddresponseModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
