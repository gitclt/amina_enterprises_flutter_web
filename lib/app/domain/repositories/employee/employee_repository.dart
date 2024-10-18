import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/employee/employee_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class EmployeeRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, EmployeeModel>> getEmployeeList(
      int pageSize, int currentPage) async {
    try {
      dynamic response = await _apiServices.getApi(
        '${AppEmpUrl.view}?pageSize=$pageSize&page=$currentPage',
      );

      if (response != null && response["status"] == true) {
        EmployeeModel res = EmployeeModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, ApiModel>> addEmployee(
      {required EmpAddModel add}) async {
    try {
      var body = json.encode(add);
      dynamic response =
          await _apiServices.postApi(body, AppEmpUrl.add, isJson: true);

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

  Future<Either<Failure, ApiModel>> updateEmployee(
      {required EmpAddModel update}) async {
    try {
      var body = json.encode(update);
      dynamic response =
          await _apiServices.putApi(body, AppEmpUrl.edit, isJson: true);

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

  Future<Either<Failure, ApiModel>> deleteEmployee({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response = await _apiServices.postApi(body, AppEmpUrl.delete);

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
