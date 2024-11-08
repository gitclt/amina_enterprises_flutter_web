import 'package:amina_enterprises_flutter_web/app/data/app_url/order/order_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/order/order_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';

class OrderRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, OrderModel>> getOrderList(
      int pageSize, int currentPage) async {
    try {
      dynamic response = await _apiServices.getApi(
        '${OrderUrl.view}?pageSize=$pageSize&page=$currentPage',
      );

      if (response != null && response["status"] == true) {
        OrderModel res = OrderModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

}