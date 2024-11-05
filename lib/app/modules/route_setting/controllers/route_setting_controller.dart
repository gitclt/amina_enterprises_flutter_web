import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/route_settings/route_setting_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteSettingController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = RouteSettingRepository();
  RxList<RouteSetting> data = <RouteSetting>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  DropDownModel dropDownState = DropDownModel();
  DropDownModel dropDownDistrict = DropDownModel();
  RxBool isStateLoading = false.obs;
  RxBool isDisLoading = false.obs;
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;

  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  RxBool isLoading = false.obs;
  String editId = '';

  @override
  void onInit() {
    get();
    getState();
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
  void editClick(RouteSetting data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.routeSettingAdd);
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
          Get.rootDelegate.toNamed(Routes.routeSetting);
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
          Get.rootDelegate.toNamed(Routes.routeSetting);
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
      Utils.snackBar('RouteSetting Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('RouteSetting', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }

  getState() async {
    isStateLoading(true);
    stateDropList.clear();
    final res = await stateRepo.getList();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);

      for (var state in resData.data!) {
        stateDropList
            .add(DropDownModel(id: state.id.toString(), name: state.name));
      }
    });
  }

  getDistrict() async {
    isDisLoading(true);
    districtDropList.clear();
    final res = await districtRepo.getList(stateId: dropDownState.id);
    res.fold((failure) {
      isDisLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isDisLoading(false);

      for (var d in resData.data!) {
        districtDropList
            .add(DropDownModel(id: d.id.toString(), name: d.district));
      }
    });
  }
}
