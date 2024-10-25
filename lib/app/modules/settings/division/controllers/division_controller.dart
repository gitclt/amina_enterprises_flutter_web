import 'package:amina_enterprises_flutter_web/app/data/model/settings/division/division_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/division/division_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivisionController extends GetxController {
 final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = DivisionRepository();
  RxList<Division> data = <Division>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
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
  void editClick(Division data) async {
    nameController = TextEditingController(text: data.division);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.divisionAdd);
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
          Get.rootDelegate.toNamed(Routes.division);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

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
          Get.rootDelegate.toNamed(Routes.division);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

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
      Utils.snackBar('Division Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Division', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
