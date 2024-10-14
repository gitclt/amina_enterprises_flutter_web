import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/pro_category/pro_category_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class ProApplicationRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, ProCategoryListModel>> getProApplicationList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.proApplicationListApi,
      );

      if (response != null && response["status"] == true) {
        ProCategoryListModel res = ProCategoryListModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add
  Future<Either<Failure, ApiModel>> addProApplication(
    String name,
  ) async {
    try {
      var data = {
        "Name": name,
      };
      dynamic response = await _apiServices.postApi(
        data,
        SettingsUrl.proApplicationAddApi,
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

  Future<Either<Failure, ApiModel>> editProApplication({
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
        SettingsUrl.proApplicationEditApi,
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
  Future<Either<Failure, ApiModel>> deleteProApplication({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.proApplicationDeleteApi);

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
