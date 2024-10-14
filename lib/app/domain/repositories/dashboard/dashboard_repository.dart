import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/dashboard/dashboard_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/dashboard/dashboard_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class DashboardRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, DashboardCountModel>> getDashboardCount() async {
    try {
      dynamic response =
          await _apiServices.getApi(DashboardUrl.dashboardCountApi);

      if (response != null && response["status"] == true) {
        DashboardCountModel res = DashboardCountModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //dashboardCount
  Future<Either<Failure, ApiModel>> deleteProCategory({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.postApi(body, DashboardUrl.dashboardCountApi);

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
