import 'package:amina_enterprises_flutter_web/app/data/model/settings/size/size_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  final formkey = GlobalKey<FormState>();
 // final _repo = DistrictRepository();
  TextEditingController nameController = TextEditingController();
  RxList<SizeData> data = <SizeData>[].obs;
  String editId = '';

  @override
  void onInit() {
 //   get();
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  // void get() async {
  //   setRxRequestStatus(Status.loading);
  //   data.clear();
  //   final res = await _repo.getList();
  //   res.fold((failure) {
  //     setRxRequestStatus(Status.completed);
  //     setError(error.toString());
  //   }, (resData) {
  //     setRxRequestStatus(Status.completed);
  //     if (resData.data != null) {
  //       data.addAll(resData.data!);
  //     }
  //   });
  // }

  void delete(String string) {}

  void editClick(SizeData item) {}
}
