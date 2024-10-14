import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/app_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/designation/designation_list_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class MasterRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, DesignationListModel>> getDesignationList() async {
    try {
      dynamic response = await _apiServices.getApi(
        AppUrl.designationApi,
      );

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
}
