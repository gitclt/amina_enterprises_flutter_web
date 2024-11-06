import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/customer/customer_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class CustomerRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, CustomerModel>> getCustomerList({
    String? stateid,
    String? districtId,
    required String page,
    required String pageSize,
  }) async {
    try {
      dynamic response = await _apiServices.getApi(
          '${AppCusUrl.view}?state_id=$stateid&district_id=$districtId&page=$page&pageSize=$pageSize');

      if (response != null && response["status"] == true) {
        CustomerModel res = CustomerModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, ApiModel>> addCustomer(
      {required CustomerAddModel add}) async {
    try {
      var body = json.encode(add);
      dynamic response =
          await _apiServices.postApi(body, AppCusUrl.add, isJson: true);

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

  Future<Either<Failure, ApiModel>> updateCustomer(
      {required CustomerAddModel add}) async {
    try {
      var body = json.encode(add);
      dynamic response =
          await _apiServices.putApi(body, AppCusUrl.edit, isJson: true);

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

  Future<Either<Failure, ApiModel>> deleteCustomer({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response = await _apiServices.deleteApi(body, AppCusUrl.delete);

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
