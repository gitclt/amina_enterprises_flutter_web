import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/data/model/settings/color/color_model.dart';
import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class ColorRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, ColorModel>> getList() async {
    try {
      dynamic response = await getApi(SettingsUrl.colorListApi);

      if (response != null && response["status"] == true) {
        ColorModel res = ColorModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

//add
  Future<Either<Failure, ApiModel>> add(String name, String colorcode) async {
    try {
      var body = json.encode({"name": name, "color_code": colorcode});
      dynamic response = await _apiServices
          .postApi(body, SettingsUrl.colorAddApi, isJson: true);

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

  Future<Either<Failure, ApiModel>> edit(
      {required String id, required String name, required String code}) async {
    try {
      var body = json.encode({"id": id, "name": name, "color_code": code});
      dynamic response = await _apiServices
          .putApi(body, SettingsUrl.colorEditApi, isJson: true);

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
          await _apiServices.deleteApi(body, SettingsUrl.colorDeleteApi);

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
