import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_category/pro_category_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class ProCategoryRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, ProductCategoryModel>> getProCategoryList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.proCategoryListApi,
      );

      if (response != null && response["status"] == true) {
        ProductCategoryModel res = ProductCategoryModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add
  Future<Either<Failure, ApiModel>> addProCategory(
    String name,
  ) async {
    try {
       var body = json.encode({
        "name": name,
      });
      dynamic response = await _apiServices.postApi(
        body,
        SettingsUrl.proCategoryAddApi,
        isJson: true
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

  //edit

  Future<Either<Failure, ApiModel>> editProCategory({
    required String id,
    required String name,
  }) async {
    try {
     var body = json.encode({
        "id": id,
        "name": name,
      });
      dynamic response = await _apiServices.putApi(
        body,
        SettingsUrl.proCategoryEditApi,
        isJson: true
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
  Future<Either<Failure, ApiModel>> deleteProCategory({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, SettingsUrl.proCategoryDeleteApi);

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
