import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/designation/designation_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class DesignationRepository extends NetworkApiServices {
  final _apiServices = NetworkApiServices();

  //view

  Future<Either<Failure, DesignationListModel>> designationView() async {
    try {
      dynamic response = await getApi(SettingsUrl.designationView);

      if (response != null && response["status"] == true) {
        DesignationListModel res = DesignationListModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //add
  Future<Either<Failure, ApiModel>> addDesignation(
    String name,
  ) async {
    try {
      var data = {
        "name": name,
      };
      dynamic response = await _apiServices.postApi(
        data,
        SettingsUrl.designationAdd,
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

  Future<Either<Failure, ApiModel>> editDesignation({
    required String id,
    required String name,
  }) async {
    try {
      var data = {
        "id": id,
        "name": name,
      };
      dynamic response = await _apiServices.putApi(
        data,
        SettingsUrl.designationEdit,
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
  Future<Either<Failure, ApiModel>> deleteDesignation({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, SettingsUrl.designationDelete);

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
