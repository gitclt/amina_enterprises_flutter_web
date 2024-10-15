import 'package:amina_enterprises_flutter_web/app/data/model/dashboard/dashboard_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/dashboard/dashboard_repository.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {
  final Map<String, Color> colorCodes = {
    "Employee": const Color(0xff6e852d),
    "Lead": const Color(0xffe73268),
    "Prospective1": const Color(0xff78428e),
    "Prospective2": const Color(0xfff1d218),
    "LeadEnquiry": const Color(0xff0a3473),
    "Customer": const Color(0xff6e852d),
    "CustomerInactive": const Color(0xffdd6d22),
  };
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final _countRepo = DashboardRepository();
  RxList<DashCountData> dashboardCount = <DashCountData>[].obs;

  void setdashboardCount(List<DashCountData> value) {
    dashboardCount.clear();
    dashboardCount.addAll(value);
  }

  @override
  void onInit() {
   // getDashboardCount();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void getDashboardCount() async {
    setRxRequestStatus(Status.loading);

    final res = await _countRepo.getDashboardCount();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Count Error', failure.message);
      setError(error.toString());
    }, (resData) {
      if (resData.data != null) {
        setRxRequestStatus(Status.completed);
        setdashboardCount(resData.data!);
      }
     
    });
  }
}
