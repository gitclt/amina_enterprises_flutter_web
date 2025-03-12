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

  //add
  Future<Either<Failure, ApiModel>> assignRoute({
    required String empId,
    String? monRouteId,
    String? tueRouteId,
    String? wedRouteId,
    String? thuRouteId,
    String? friRouteId,
    String? satRouteId,
  }) async {
    try {
      var data = json.encode({
        "emp_id": empId,
        "mon_route_id": monRouteId,
        "tue_route_id": tueRouteId,
        "wed_route_id": wedRouteId,
        "thu_route_id": thuRouteId,
        "fri_route_id": friRouteId,
        "sat_route_id": satRouteId,
        "addedby": 1
      });
      dynamic response =
          await _apiServices.postApi(data, AppEmpUrl.assignRoute, isJson: true);

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

  Future<Either<Failure, ApiModel>> assignRouteUpdate({
    required String editId,
    required String empId,
    String? monRouteId,
    String? tueRouteId,
    String? wedRouteId,
    String? thuRouteId,
    String? friRouteId,
    String? satRouteId,
  }) async {
    try {
      var data = json.encode({
        "id": editId,
        "emp_id": empId,
        "mon_route_id": monRouteId ?? '0',
        "tue_route_id": tueRouteId ?? '0',
        "wed_route_id": wedRouteId ?? '0',
        "thu_route_id": thuRouteId ?? '0',
        "fri_route_id": friRouteId ?? '0',
        "sat_route_id": satRouteId ?? '0',
        "addedby": 1
      });
      dynamic response = await _apiServices
          .postApi(data, AppEmpUrl.assignRouteUpdate, isJson: true);

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
      dynamic response = await _apiServices.deleteApi(body, AppEmpUrl.delete);

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
