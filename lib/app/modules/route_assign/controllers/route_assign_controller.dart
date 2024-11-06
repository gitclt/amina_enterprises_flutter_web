import 'package:amina_enterprises_flutter_web/app/data/model/employee/employee_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/employee/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAssignController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  RxBool isDisLoading = false.obs;
  RxBool isDivisionLoading = false.obs;
  RxString error = ''.obs;
  final _repo = EmployeeRepository();
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  int offset = 0;

  final formkey = GlobalKey<FormState>();
  RxList<EmployeeData> data = <EmployeeData>[].obs;
  RxList<EmployeeData> dataCopy = <EmployeeData>[].obs;

  @override
  void onInit() {
    get();

    super.onInit();
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getEmployeeList(pageSize, currentPage.value);
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
        totalPages.value = (resData.totalPages ?? 1 / pageSize).ceil();
      }
    });
  }
}
