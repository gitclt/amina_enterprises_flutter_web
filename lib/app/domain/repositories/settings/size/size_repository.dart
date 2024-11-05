import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/size/size_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class SizeRepository extends NetworkApiServices {
  // final _apiServices = NetworkApiServices();

  Future<Either<Failure, ProductsizeModel>> getList(
      // {
      // String? stateId,
      // }
      ) async {
    try {
      dynamic response = await getApi(SettingsUrl.sizeListApi);

      if (response != null && response["status"] == true) {
        ProductsizeModel res = ProductsizeModel.fromJson(response);

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
      String size, String mainCatId, String catId, String type) async {
    try {
      var data = json
          .encode({"size": size, "main_cat_id": mainCatId, "cat_id": catId,
        "type": type
      });
      dynamic response =
          await postApi(data, SettingsUrl.sizeAddApi, isJson: true);

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
      String id, String size, String mainCatId, String catId,String type) async {
    try {
      var data = json.encode(
          {"id": id, "size": size, "main_cat_id": mainCatId, "cat_id": catId,
          "type":type
          });
      dynamic response =
          await putApi(data, SettingsUrl.sizeEditApi, isJson: true);

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
  Future<Either<Failure, ApiModel>> delete({String? id}) async {
    try {
      var body = {"id": id};
      dynamic response = await deleteApi(body, SettingsUrl.sizeDeleteApi);

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
