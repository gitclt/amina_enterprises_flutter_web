import 'dart:convert';

import 'package:amina_enterprises_flutter_web/app/core/failure/failure.dart';
import 'package:amina_enterprises_flutter_web/app/data/app_url/product/product_url.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/api_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/pro_item_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_add_response_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_detail_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/product/product_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/network/network_api_services.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  final _apiServices = NetworkApiServices();

  Future<Either<Failure, ProductModel>> getProductList(
      int pageSize, int currentPage) async {
    try {
      dynamic response = await _apiServices.getApi(ProductUrl.view);

      if (response != null && response["status"] == true) {
        ProductModel res = ProductModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, ProAddresponseModel>> addProduct({
    required ProductAddModel data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response =
          await _apiServices.postApi(body, ProductUrl.add, isJson: true);

      if (response != null && response["status"] == true) {
        ProAddresponseModel res = ProAddresponseModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, ApiModel>> updateProduct({
    required ProductAddModel data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response =
          await _apiServices.putApi(body, ProductUrl.edit, isJson: true);

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

  Future<Either<Failure, ApiModel>> addProductItem({
    List<ProductitemAddModel>? data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response =
          await _apiServices.postApi(body, ProductUrl.proAddItem, isJson: true);

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

  Future<Either<Failure, ApiModel>> editProductItem({
    ProductitemAddModel? data,
  }) async {
    try {
      var body = json.encode(
        data,
      );
      dynamic response = await _apiServices
          .putApi(body, ProductUrl.productDetailsedit, isJson: true);

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
  // Future<Either<Failure, ApiModel>> updateCustomer(
  //     {required String editId,
  //     required String name,
  //     required String code,
  //     required String password,
  //     required String cusType,
  //     required String mobile,
  //     required String email,
  //     required String place,
  //     required String state,
  //     required String districtId,
  //     required String address,
  //     required String pincode,
  //     required String status,
  //     String? empid}) async {
  //   try {
  //     var body = json.encode({
  //       "id": editId,
  //       "name": name,
  //       "code": code,
  //       "customer_type": cusType,
  //       "password": password,
  //       "mobile": mobile,
  //       "email": email,
  //       "place": place,
  //       "state_id": state,
  //       "district_id": districtId,
  //       "pincode": pincode,
  //       "address": address,
  //       "status": status,
  //       "created_emp_id": empid,
  //     });
  //     dynamic response =
  //         await _apiServices.putApi(body, AppCusUrl.edit, isJson: true);

  //     if (response != null && response["status"] == true) {
  //       ApiModel res = ApiModel.fromJson(response);

  //       return Right(res);
  //     } else {
  //       return Left(Failure(response["message"].toString()));
  //     }
  //   } catch (e) {
  //     return Left(Failure(e.toString()));
  //   }
  // }

  Future<Either<Failure, ApiModel>> deleteProduct({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response = await _apiServices.deleteApi(body, ProductUrl.delete);

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

  Future<Either<Failure, ApiModel>> deleteProductItem({
    required String id,
  }) async {
    var body = {"id": id};
    try {
      dynamic response =
          await _apiServices.deleteApi(body, ProductUrl.deleteItem);

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

  Future<Either<Failure, ProductDetailModel>> getProductDetails(
      {int? pageSize, int? currentPage, dynamic proId}) async {
    try {
      dynamic response = await _apiServices
          .getApi('${ProductUrl.productDetailsview}?product_id=$proId');

      if (response != null && response["status"] == true) {
        ProductDetailModel res = ProductDetailModel.fromJson(response);

        return Right(res);
      } else {
        return Left(Failure(response["message"].toString()));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
