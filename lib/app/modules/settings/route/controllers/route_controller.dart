import 'package:amina_enterprises_flutter_web/app/data/model/settings/route/route_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/route/route_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = RouteRepository();

  RxList<RouteData> data = <RouteData>[].obs;

  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  RxBool isStateLoading = false.obs;
  RxBool isCustomerLoading = false.obs;
  RxBool isDisLoading = false.obs;

  RxBool isLoading = false.obs;
  String editId = '';

  @override
  void onInit() {
    get();

    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
      }
    });
  }

  //edit
  void editClick(RouteData data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
     Get.rootDelegate.toNamed(Routes.routeAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.edit(id: editId, name: nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.route);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //add

  void add() async {
    isLoading(true);
    final res = await _repo.add(nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
         Get.rootDelegate.toNamed(Routes.route);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.delete(id: id);
    res.fold((failure) {
      Utils.snackBar('Route Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Route', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
