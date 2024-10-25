import 'package:amina_enterprises_flutter_web/app/constants/const_valus.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/customer/customer_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/customer/customer_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/district/distrct_repository.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/state/state_repository.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final rxRequestStatus = Status.completed.obs;

  RxString error = ''.obs;
  final _repo = CustomerRepository();
  final stateRepo = StateRepository();
  final districtRepo = DistrictRepository();
  RxList<Customer> data = <Customer>[].obs;
  final formkey = GlobalKey<FormState>();
  final int pageSize = 10;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  RxBool isDistrictLoading = false.obs;
  String editId = '';

//list
  DropDownModel sdSearchState = DropDownModel();
  DropDownModel sdSearchDistrict = DropDownModel();
  DropDownModel sdState = DropDownModel();
  DropDownModel sdDistrict = DropDownModel();
  DropDownModel sdType = DropDownModel();
  DropDownModel sdStatus = DropDownModel();

  RxList<DropDownModel> searchStateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> searchDistrictDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> typeDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> statusDropList = <DropDownModel>[].obs;

  RxBool isSearchStateLoading = false.obs;
  RxBool isSearchDistrictLoading = false.obs;

  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> districtDropList = <DropDownModel>[].obs;

  @override
  void onInit() {
    getState();

    get();
    getSearchState();
    for (var v in AppConstValue().custemerTypes) {
      typeDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
    }
    for (var v in AppConstValue().statusTypes) {
      statusDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
    }
    super.onInit();
  }

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void get() async {
    setRxRequestStatus(Status.loading);
    data.clear();
    final res = await _repo.getCustomerList(
      stateid: sdSearchState.id ?? '',
      districtId: sdSearchDistrict.id ?? '',
    );
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      if (resData.data != null) {
        data.addAll(resData.data!);
        totalPages.value = (resData.totalCount! / pageSize).ceil();
      }
    });
  }

  void changePage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page; // Update current page
      get(); // Fetch the employee list for the new page
    }
  }

  void getSearchState() async {
    isSearchStateLoading(true);
    searchStateDropList.clear();
    final res = await stateRepo.getList();
    res.fold((failure) {
      isSearchStateLoading(false);
      Utils.snackBar('State', failure.message);
      setError(error.toString());
    }, (resData) {
      isSearchStateLoading(false);

      for (var state in resData.data!) {
        searchStateDropList
            .add(DropDownModel(id: state.id.toString(), name: state.name));
      }
    });
  }

  void getSearchDistrict() async {
    isSearchDistrictLoading(true);
    sdSearchDistrict = DropDownModel(id: '', name: '--Select District--');
    searchDistrictDropList.clear();
    final res =
        await districtRepo.getList(stateId: sdSearchState.id.toString());
    res.fold((failure) {
      isSearchDistrictLoading(false);
      Utils.snackBar('Location', failure.message);
      setError(error.toString());
    }, (resData) {
      isSearchDistrictLoading(false);

      for (var p in resData.data!) {
        searchDistrictDropList
            .add(DropDownModel(id: p.id.toString(), name: p.district));
      }
    });
  }

// add view
  void getState() async {
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

  void getDistrict() async {
    isDistrictLoading(true);
    sdDistrict = DropDownModel(id: '', name: '--Select District--');
    districtDropList.clear();
    final res = await districtRepo.getList(stateId: sdState.id ?? '');
    res.fold((failure) {
      isDistrictLoading(false);
      Utils.snackBar('District', failure.message);
      setError(error.toString());
    }, (resData) {
      isDistrictLoading(false);

      for (var district in resData.data!) {
        districtDropList.add(
            DropDownModel(id: district.id.toString(), name: district.district));
      }
    });
  }

  //edit
  void editClick(Customer data) async {
    nameController = TextEditingController(text: data.name);
    codeController = TextEditingController(text: data.code);
    sdType = DropDownModel(id: data.customerType, name: data.customerType);
    passwordController = TextEditingController(text: data.password);
    emailController = TextEditingController(text: data.email);
    mobileController = TextEditingController(text: data.mobile);
    addressController = TextEditingController(text: data.address);
    placeController = TextEditingController(text: data.place);
    //Controller = TextEditingController(text: data.name);
    pincodeController = TextEditingController(text: data.pincode.toString());
    sdState = DropDownModel(id: data.stateId.toString(), name: data.state);
    sdDistrict =
        DropDownModel(id: data.districtId.toString(), name: data.district);
    sdStatus = DropDownModel(id: data.status, name: data.status);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.customerAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.updateCustomer(
        editId: editId,
        name: nameController.text.trim(),
        code: codeController.text.trim(),
        cusType: sdType.id.toString(),
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address: addressController.text.trim(),
        place: placeController.text.trim(),
        districtId: sdDistrict.id.toString(),
        pincode: pincodeController.text.trim(),
        state: sdState.id.toString(),
        status: sdStatus.id.toString(),
        empid: '1');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.customer);
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
    final res = await _repo.addCustomer(
        name: nameController.text.trim(),
        code: codeController.text.trim(),
        cusType: sdType.id.toString(),
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address: addressController.text.trim(),
        place: placeController.text.trim(),
        districtId: sdDistrict.id.toString(),
        pincode: pincodeController.text.trim(),
        state: sdState.id.toString(),
        status: sdStatus.id.toString(),
        empid: '1');

    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.customer);
          Utils.snackBar('Sucess', resData.message ?? '', type: 'success');

          get();

          // clrValue();
        }
      },
    );
  }

  //delete
  void delete(String id) async {
    final res = await _repo.deleteCustomer(id: id);
    res.fold((failure) {
      Utils.snackBar('Customer Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Customer', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
    codeController.clear();
    sdType = DropDownModel(id: '', name: '--Select Type--');
    sdDistrict = DropDownModel(id: '', name: '--Select District--');
    sdState = DropDownModel(id: '', name: '--Select State--');
    sdStatus = DropDownModel(id: '', name: '--Select Status--');
    passwordController.clear();
    emailController.clear();
    mobileController.clear();
    addressController.clear();
    placeController.clear();
    pincodeController.clear();
  }
}
