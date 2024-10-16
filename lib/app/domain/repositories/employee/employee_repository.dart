import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/employee/employee_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
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
      {required String name,
      required String password,
      required String mobile,
      required String email,
      required String state,
      required String location,
      required String designationId,
      required String dob,
      required String doj,
      required String address,
      required String roleId,
      required String branchId,
      required String isBde,
      required String macid}) async {
    try {
      var body = json.encode({
        "name": name,
        "password": password,
        "mobile": mobile,
        "email": email,
        "state": state,
        "location": location,
        "designation_id": designationId,
        "dob": dob,
        "doj": doj,
        "address": address,
        "role_id": roleId,
        "branch_id": branchId,
        "isBdm": isBde,
        "mac_id": macid
      });
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
      {required String id,
      required String name,
      required String password,
      required String mobile,
      required String email,
      required String state,
      required String location,
      required String designationId,
      required String dob,
      required String doj,
      required String address,
      required String roleId,
      required String branchId,
      required String isBde,
      required String macId}) async {
    try {
      var body = json.encode({
        "id": id,
        "name": name,
        "password": password,
        "mobile": mobile,
        "email": email,
        "state": state,
        "location": location,
        "designation_id": designationId,
        "dob": dob,
        "doj": doj,
        "address": address,
        "role_id": roleId,
        "branch_id": branchId,
        "isBdm": isBde,
        "mac_id": macId
      });
      dynamic response =
          await _apiServices.postApi(body, AppEmpUrl.edit, isJson: true);

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
