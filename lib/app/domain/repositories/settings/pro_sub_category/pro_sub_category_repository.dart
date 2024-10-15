import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_sub_category/pro_sub_category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class ProSubCategoryRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, SubCategoryModel>> getList() async {
    try {
      dynamic response = await getApi(SettingsUrl.subCategoryListApi);

      if (response != null && response["status"] == true) {
        SubCategoryModel res = SubCategoryModel.fromJson(response);

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
    String procatid,
  ) async {
    try {
      var data = {
        "name": name,
        "procat_id": procatid,
      };
      dynamic response = await _apiServices.postApi(
        data,
        SettingsUrl.subCategoryAddApi,
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

  Future<Either<Failure, ApiModel>> edit({
    required String id,
    required String name,
    required String procatid,
  }) async {
    try {
      var data = {
        "id": id,
        "name": name,
        "procat_id": procatid,
      };
      dynamic response = await _apiServices.putApi(
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
  Future<Either<Failure, ApiModel>> delete({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, SettingsUrl.subCategoryDeleteApi);

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
