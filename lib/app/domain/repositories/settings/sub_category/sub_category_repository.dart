import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/sub_category/sub_category_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class SubCategoryRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, SubCategoryListModel>> getSubCategoryList(
      {String? catId}) async {
    try {
      dynamic response = await _apiServices
          .getApi("${SettingsUrl.subCategoryListApi}?cat_id=$catId");

      if (response != null && response["status"] == true) {
        SubCategoryListModel res = SubCategoryListModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add

  Future<Either<Failure, ApiModel>> addSubCategory(
      {required String name, required String catId}) async {
    try {
      var body = json.encode({"Name": name, "Cat_id": catId});

      dynamic response = await _apiServices
          .postApi(body, SettingsUrl.subCategoryAddApi, isJson: true);

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

  Future<Either<Failure, ApiModel>> editSubCategory({
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
        SettingsUrl.subCategoryEditApi,
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
  Future<Either<Failure, ApiModel>> deleteSubCategory({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.subCategoryDeleteApi);

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
