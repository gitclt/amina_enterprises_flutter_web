import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/settings/settings_url.dart';
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
}
