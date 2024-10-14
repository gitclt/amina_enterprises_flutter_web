import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/place/place_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/place/place_repository.dart';

import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';

class PlaceController extends GetxController {
  // final List<String> categoryList = [];
  final rxRequestStatus = Status.completed.obs;
  RxString error = ''.obs;
  String editId = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  DropDownModel state = DropDownModel();

  RxBool isAddLoading = false.obs;

  RxList<PlaceListData> placeList = <PlaceListData>[].obs;
  RxList<PlaceListData> placeListCopy = <PlaceListData>[].obs;
  RxBool isLoading = false.obs;
  final formkey = GlobalKey<FormState>();
 // final stateRepo = StatePlaceRepository();

  final _proplaceRepo = PlaceRepository();
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  @override
  void onInit() {
    getplaceList();
   // getstateList();
    super.onInit();
  }

//search
  void searchData(String value) {
    placeList.clear();

    if (value.isEmpty) {
      placeList.addAll(placeListCopy);
    } else {
      placeList.clear();
      placeList.addAll(placeListCopy
          .where(
              (data) => data.name!.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
  }

//view
  void setplaceList(List<PlaceListData> value) {
    placeList.clear();
    placeListCopy.clear();
    placeList.addAll(value);
    placeListCopy.addAll(value);
  }

  void getplaceList() async {
    setRxRequestStatus(Status.loading);

    final res = await _proplaceRepo.getPlaceList();
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Place Error', failure.message);
      setError(error.toString());
    }, (resData) {
      if (resData.data != null) {
        setRxRequestStatus(Status.completed);

        // if (resData.data == null || resData.data!.isEmpty) return;

        setplaceList(resData.data!);
      }
    });
  }
  //add

  // void addPlace() async {
  //   isLoading(true);
  //   final res = await _proplaceRepo.addPlace(
  //       name: nameController.text, stateId: state.id ?? '');
  //   res.fold(
  //     (failure) {
  //       isLoading(false);
  //       Utils.snackBar('Error', failure.message);
  //       setError(error.toString());
  //     },
  //     (resData) {
  //       if (resData.status!) {
  //         isLoading(false);
  //         Get.rootDelegate.toNamed(Routes.place);
  //         Utils.snackBar('Place', resData.message ?? '', type: 'success');

  //         getplaceList();

  //         // clrValue();
  //       }
  //     },
  //   );
  // }

  // //edit
  // void editClick(PlaceListData data) async {
  //   nameController = TextEditingController(text: data.name);
  //   state = DropDownModel(id: data.stateId.toString(), name: data.state);
  //   // stateController.text = data.state.toString();
  //   editId = data.id.toString();
  //   Get.rootDelegate.toNamed(Routes.placeAdd);
  // }

  // editPlace() async {
  //   isLoading(true);
  //   final res =
  //       await _proplaceRepo.editPlace(id: editId, name: nameController.text);
  //   res.fold(
  //     (failure) {
  //       isLoading(false);
  //       Utils.snackBar('Error', failure.message);
  //       setError(error.toString());
  //     },
  //     (resData) {
  //       if (resData.status!) {
  //         isLoading(false);
  //         Get.rootDelegate.toNamed(Routes.place);
  //         Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

  //         getplaceList();

  //         // clrValue();
  //       }
  //     },
  //   );
  // }

  // //delete
  // void delete(String id) async {
  //   final res = await _proplaceRepo.deletePlace(id: id);
  //   res.fold((failure) {
  //     Utils.snackBar('Place Error', failure.message);
  //     setError(error.toString());
  //   }, (resData) {
  //     Utils.snackBar('Place', resData.message!);
  //     getplaceList();
  //   });
  // }

  clear() {
    editId = '';
    nameController.clear();
    stateController.clear();
    state = DropDownModel();
  }

  // void getstateList() async {
  //   isAddLoading(true);
  //   stateDropList.clear();
  //   stateDropList.add(DropDownModel(id: '', name: '--Select State--'));
  //   final res = await stateRepo.getStateList();
  //   res.fold((failure) {
  //     isAddLoading(false);
  //     Utils.snackBar('Error', failure.message);
  //     setError(error.toString());
  //   }, (resData) {
  //     isAddLoading(false);
  //     for (var item in resData.data) {
  //       stateDropList
  //           .add(DropDownModel(id: item.id.toString(), name: item.name));
  //     }
  //   });
  // }
}
