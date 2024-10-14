import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/place/place_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class PlaceRepository {
  final _apiServices = NetworkApiServices();
//view
  Future<Either<Failure, PlaceModel>> getPlaceList() async {
    try {
      dynamic response = await _apiServices.getApi(
        SettingsUrl.placeListApi,
      );

      if (response != null && response["status"] == true) {
        PlaceModel res = PlaceModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

//add
  Future<Either<Failure, ApiModel>> addPlace(
      {required String stateId, name}) async {
    try {
      var data = {
        "state_id": stateId,
        "name": name,
      };
      dynamic response = await _apiServices.postApi(
        data,
        SettingsUrl.placeAddApi,
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

  Future<Either<Failure, ApiModel>> editPlace({
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
        SettingsUrl.placeEditApi,
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
  Future<Either<Failure, ApiModel>> deletePlace({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, SettingsUrl.placeDeleteApi);

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
