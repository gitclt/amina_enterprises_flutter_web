import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_add_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/route_settings/route_setting_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/customer/customer_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/route_settings/route_setting_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/place/place_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteSettingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = RouteSettingRepository();
  // final _repo = RouteSettingRepository();
  final customerRepo = CustomerRepository();
  RxList<RouteSetting> data = <RouteSetting>[].obs;
  RxList<CustomerData> customerdata = <CustomerData>[].obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  DropDownModel dropDownState = DropDownModel();
  DropDownModel dropDownDistrict = DropDownModel();
  DropDownModel dropDownPlace = DropDownModel();
  RxBool isStateLoading = false.obs;
  RxBool isCustomerLoading = false.obs;
  RxBool isDisLoading = false.obs;
  RxBool isPlaceLoading = false.obs;
  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> placeDropList = <DropDownModel>[].obs;
  late TabController tabcontroller;
  var isIndex = 0.obs;
  int routeId = 0;

  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  final placeRepo = PlaceRepository();
  RxBool isLoading = false.obs;
  String editId = '';

  @override
  void onInit() {
    get();
    getState();
    tabcontroller = TabController(vsync: this, length: 3);
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  Future<void> get({String? rootid}) async {
    data.clear();
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getList(rootid: rootid ?? '');
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

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  //customer_filterList
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  void getCustomer() async {
    //  isCustomerLoading(true);
    setRxRequestStatus(Status.loading);
    customerdata.clear();
    final res = await customerRepo.getCustomerList(
        stateid: dropDownState.id ?? '',
        districtId: dropDownDistrict.id ?? '',
        placeId: dropDownPlace.id ?? '',
        page: currentPage.toString(),
        pageSize: pageSize.toString(),
        routeId: routeId.toString());
    res.fold((failure) {
      //  isCustomerLoading(false);
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      //  isCustomerLoading(false);
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        customerdata.addAll(resData.data!);
        totalPages.value = (resData.totalCount! / pageSize).ceil();
      }
    });
  }

  //add

  void addRouteName() async {
    isLoading(true);
    final res = await _repo.addRouteName(nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          routeId = resData.data!.id!;
          isIndex.value = 1;
          tabcontroller.animateTo(1);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          // getdetails();

          // clrValue();
        }
      },
    );
  }

  //editroutename
  void editClickName(RouteSetting data) async {
    nameController = TextEditingController(text: data.rootName);
    editId = data.rootId.toString();
    routeId = data.rootId!;
    // int.tryParse('${data.rootId}');
    Get.rootDelegate.toNamed(Routes.routeSettingAdd);
  }

  editName() async {
    isLoading(true);
    final res =
        await _repo.editRouteName(id: editId, name: nameController.text);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          isIndex.value = 1;
          tabcontroller.animateTo(1);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');
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

  getPlace() async {
    isPlaceLoading(true);
    placeDropList.clear();
    final res = await placeRepo.getList(
        stateId: dropDownState.id, districtId: dropDownDistrict.id);
    res.fold((failure) {
      isPlaceLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isPlaceLoading(false);

      for (var d in resData.data!) {
        placeDropList.add(DropDownModel(id: d.id.toString(), name: d.name));
      }
    });
  }

  void addRoute() async {
    isLoading(true);
    final selectedItem =
        customerdata.where((e) => e.isSelect!.value == true).toList();

    final addedItem = selectedItem.map((item) {
      return RouteAddModel(customerId: item.id, rootId: routeId);
    }).toList();
    final res = await _repo.addRoute(data: addedItem);
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          isIndex.value = 2;
          tabcontroller.animateTo(2);
          Utils.snackBar('Success', resData.message ?? '', type: 'success');

          get(rootid: routeId.toString());
        }
      },
    );
  }
  //updateroute

  // void editClick(RouteSetting data) async {
  //   nameController = TextEditingController(text: data.rootName);
  //   editId = data.rootId.toString();
  //   Get.rootDelegate.toNamed(Routes.routeSettingAdd);
  // }

  updateRoute() async {
    //   isLoading(true);
    //   final selectedItem =
    //       customerdata.where((e) => e.isSelect!.value == true).toList();

    //   final addedItem = selectedItem.map((item) {
    //     return RouteAddModel(
    //       editId: editId,
    //       customerId: item.id, rootId: routeId);
    //   }).toList();
    //   final res = await _repo.updateRoute(data: addedItem);
    //   res.fold(
    //     (failure) {
    //       isLoading(false);
    //       Utils.snackBar('Error', failure.message);
    //       setError(error.toString());
    //     },
    //     (resData) {
    //       if (resData.status!) {
    //         isLoading(false);
    //            isIndex.value = 2;
    //         tabcontroller.animateTo(2);
    //         Utils.snackBar('Success', resData.message ?? '', type: 'success');

    //         get();

    //         // clrValue();
    //       }
    //     },
    //   );
  }
}
