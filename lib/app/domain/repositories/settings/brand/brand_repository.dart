import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/data/model/settings/brand/brand_model.dart';
import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class BrandRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, BrandModel>> brandList() async {
    try {
      dynamic response = await getApi(SettingsUrl.brandView);

      if (response != null && response["status"] == true) {
        BrandModel res = BrandModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

//add
  Future<Either<Failure, ApiModel>> addBrand(
    String name,
    String image,
    String img,
  ) async {
    try {
      var body = json.encode({
        "name": name,
         "image": image,
          'image_data': img
      });
      dynamic response = await _apiServices.postApi(
        body,
        SettingsUrl.brandAdd,
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

  Future<Either<Failure, ApiModel>> editBrand({
    required String id,
    required String name,
    required String image,
  }) async {
    try {
       var body = json.encode({
        "id": id,
        "name": name,
         "image": image,
      });
      dynamic response = await _apiServices.putApi(
        body,
        SettingsUrl.brandEdit,
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
  Future<Either<Failure, ApiModel>> deleteBrand({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, SettingsUrl.brandDelete);

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
