import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/main_category/main_category_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';
import '../../../../data/app_url/settings/settings_url.dart';

class MainCategoryRepository {

  final _apiServices = NetworkApiServices();

 //view
  Future<Either<Failure, MainCategoryModel>> getList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.mainCategoryListApi,
      );

      if (response != null && response["status"] == true) {
        MainCategoryModel res = MainCategoryModel.fromJson(response);

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
    String image,
  ) async {
    try {
      var data = json.encode({
        "name": name,
        "image": image,
      });
      dynamic response = await _apiServices
          .postApi(data, SettingsUrl.mainCategoryAddApi, isJson: true);

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
    required String image,
  }) async {
    try {
      var data = json.encode({
        "id": id,
        "name": name,
        "image": image,
      });
      dynamic response = await _apiServices
          .putApi(data, SettingsUrl.mainCategoryEditApi, isJson: true);

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
          await _apiServices.deleteApi(body, SettingsUrl.mainCategoryDeleteApi);

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
