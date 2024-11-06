import 'package:amina_enterprises_flutter_web/app/data/model/settings/district/district_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/place/place_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = PlaceRepository();
  final stateRepo = StateRepository();
  RxList<DistrictData> data = <DistrictData>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  DropDownModel dropDownState = DropDownModel();
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;

  DropDownModel dropDownDistrict = DropDownModel();
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  final districtRepo = DistrictRepository();
  RxBool isDisLoading = false.obs;
  String editId = '';

  @override
  void onInit() {
    get();
    getstateList();
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

  Future<void> getstateList() async {
    isStateLoading(true);
    stateDropList.clear();
    stateDropList.add(DropDownModel(id: '', name: '--Select State--'));
    final res = await stateRepo.getList();
    res.fold((failure) {
      isStateLoading(false);
      Utils.snackBar('Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isStateLoading(false);
      for (var item in resData.data!) {
        stateDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  //edit
  void editClick(DistrictData data) async {
    nameController = TextEditingController(text: data.district);
    dropDownState =
        DropDownModel(id: data.stateId.toString(), name: data.state);
    editId = data.id.toString();

    Get.rootDelegate.toNamed(Routes.placeAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.edit(
        id: editId,
        name: nameController.text,
        stateId: dropDownState.id.toString());
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.place);
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
    final res = await _repo.add(nameController.text,
        dropDownState.id.toString(), dropDownDistrict.id.toString());
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.place);
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
      Utils.snackBar('Place Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Place', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    dropDownState = DropDownModel(id: '', name: '--Select State--');
    dropDownDistrict = DropDownModel(id: '', name: '--Select District--');
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
