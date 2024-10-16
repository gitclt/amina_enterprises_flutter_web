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

  TextEditingController nameController = TextEditingController();
   TextEditingController codeController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
     TextEditingController placeController = TextEditingController();
  // TextEditingController   typeController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isStateLoading = false.obs;
  String editId = '';

//list
  DropDownModel sdSearchState = DropDownModel();
  DropDownModel sdSearchDistrict = DropDownModel();
  DropDownModel sdState = DropDownModel();
  DropDownModel sdType = DropDownModel();

  RxList<DropDownModel> searchStateDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> searchDistrictDropList = <DropDownModel>[].obs;
  RxList<DropDownModel> typeDropList = <DropDownModel>[].obs;

  RxBool isSearchStateLoading = false.obs;
  RxBool isSearchDistrictLoading = false.obs;

  RxList<DropDownModel> stateDropList = <DropDownModel>[].obs;

  @override
  void onInit() {
    getState();
    get();
    getSearchState();
    for (var v in AppConstValue().custemerTypes) {
      typeDropList.add(DropDownModel(id: v.id.toString(), name: v.name));
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
      }
    });
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

  //edit
  void editClick(Customer data) async {
    nameController = TextEditingController(text: data.name);
    editId = data.id.toString();
    Get.rootDelegate.toNamed(Routes.customerAdd);
  }

  edit() async {
    isLoading(true);
    final res = await _repo.updateCustomer(
        id: editId,
        name: nameController.text,
        address: '',
        branchId: '',
        designationId: '',
        dob: '',
        doj: '',
        email: '',
        isBde: '',
        location: '',
        macId: '',
        mobile: '',
        password: '',
        roleId: '',
        state: ''
        );
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.construction);
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
        name: nameController.text,
        cusType: sdType.id.toString() ,
        address: '',
        branchId: '',
        designationId: '',
        dob: '',
        doj: '',
        email: '',
        isBde: '',
        location: '',
        macid: '',
        mobile: '',
        password: '',
        roleId: '',
        state: '');
    res.fold(
      (failure) {
        isLoading(false);
        Utils.snackBar('Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.status!) {
          isLoading(false);
          Get.rootDelegate.toNamed(Routes.construction);
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
      Utils.snackBar('Construction Error', failure.message);
      setError(error.toString());
    }, (resData) {
      Utils.snackBar('Construction', resData.message!);
      get();
    });
  }

  clear() {
    editId = '';
    nameController.clear();
  }
}
