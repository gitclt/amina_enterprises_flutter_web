import 'package:dartz/dartz.dart';
import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/auth/auth_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/auth/auth_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';

class ProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, UserResponse>> getProfileView(String token) async {
    // dynamic response = await _apiServices.postApi(null, AppAuthUrl.profileApi);

    // return AuthModel.fromJson(response);
    var formData = {
      "empid": token,
    };
    try {
      dynamic response = await _apiServices.postApi(
        formData,
        AppAuthUrl.profileApi,
      );

      if (response != null && response["status"] == true) {
        UserResponse user = UserResponse.fromJson(response);

        return Right(user);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
